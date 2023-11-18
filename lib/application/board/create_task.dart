import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_entity.dart';
import 'package:kanban_app/infrastructure/board/task_dto.dart';

import '../core/usecase.dart';

class CreateTask implements UseCase<TaskEntity, Either<Exception, int>> {
  IBoardRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Exception, int>> call(task) async {
    return await repository.createTask(TaskDto.fromEntity(task));
  }
}
