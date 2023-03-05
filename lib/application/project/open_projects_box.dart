import 'package:kanban_app/application/core/usecase.dart';
import 'package:kanban_app/domain/core/no_param.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';

class OpenProjectsBox implements UseCase<NoParam, void> {
  IProjectRepository repository;

  OpenProjectsBox(this.repository);

  @override
  Future<void> call(_) async {
    return await repository.openBox();
  }
}
