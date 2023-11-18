import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_model.dart';

import '../core/usecase.dart';

class CreateTask implements UseCase<TaskModel, Either<Exception, int>> {
  IBoardRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Exception, int>> call(task) async {
    return await repository.createTask(task);
  }
}
