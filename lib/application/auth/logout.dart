import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/auth/auth_failure.dart';
import 'package:kanban_app/domain/auth/credentials.dart';
import 'package:kanban_app/domain/auth/i_auth_repository.dart';
import '../core/usecase.dart';

class Logout implements UseCase<Unit, Unit> {
  IAuthRepository repository;

  Logout(this.repository);

  @override
  Future<Unit> call(_) async {
    return await repository.logout();
  }
}
