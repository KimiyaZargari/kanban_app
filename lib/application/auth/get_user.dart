import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/auth/auth_failure.dart';
import 'package:kanban_app/domain/auth/credentials.dart';
import 'package:kanban_app/domain/auth/i_auth_repository.dart';
import '../core/usecase.dart';

class GetUser implements UseCase<Unit, String?> {
  IAuthRepository repository;

  GetUser(this.repository);

  @override
  Future<String?> call(_) async {
    return await repository.getSignedInUser();
  }
}
