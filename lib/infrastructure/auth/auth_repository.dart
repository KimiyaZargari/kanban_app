import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/auth/auth_failure.dart';
import 'package:kanban_app/domain/auth/credentials.dart';
import 'package:kanban_app/domain/auth/i_auth_repository.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final googleSignInProvider = Provider<GoogleSignIn>((ref) => GoogleSignIn());
final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(
    ref.watch(firebaseAuthProvider), ref.watch(googleSignInProvider)));

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<String?> getSignedInUser() async => _firebaseAuth.currentUser?.uid;

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      Credentials credentials) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      Credentials credentials) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuthentication = await user.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Unit> logout() {
    return Future.wait(
            [Hive.close(), _firebaseAuth.signOut(), _googleSignIn.signOut()])
        .then((value) => unit);
  }
}
