import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/domain/project/project_model.dart';

import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class CreateTask implements UseCase<TaskModel, Either<Exception, int>> {
  IBoardRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Exception, int>> call(task) async {
    return repository.createTask(task);
  }
}
