import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/auth/auth_failure.dart';
import 'package:kanban_app/domain/auth/credentials.dart';
import 'package:kanban_app/domain/auth/i_auth_repository.dart';
import '../core/usecase.dart';

class SignIn implements UseCase<Credentials, Either<AuthFailure, Unit>> {
  IAuthRepository repository;

  SignIn(this.repository);

  @override
  Future<Either<AuthFailure, Unit>> call(credentials) async {
    return await repository.signInWithEmailAndPassword(credentials);
  }
}
