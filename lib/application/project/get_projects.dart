import 'package:kanban_app/application/core/usecase.dart';
import 'package:kanban_app/domain/core/no_param.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';

import '../../domain/project/project_model.dart';

class GetProjects {
  IProjectRepository repository;

  GetProjects(this.repository);

  Stream<List<ProjectModel>> call(_) async* {
    yield* repository.getProjects();
  }
}
