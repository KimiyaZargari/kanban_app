import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/auth/auth_failure.dart';
import 'package:kanban_app/domain/auth/i_auth_repository.dart';
import '../core/usecase.dart';

class GoogleLogin implements UseCase<Unit, Either<AuthFailure, Unit>> {
  IAuthRepository repository;

  GoogleLogin(this.repository);

  @override
  Future<Either<AuthFailure, Unit>> call(_) async {
    return await repository.signInWithGoogle();
  }
}
