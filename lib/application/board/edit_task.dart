import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';

import '../../domain/board/task_entity.dart';
import '../../infrastructure/board/task_dto.dart';
import '../core/usecase.dart';

class EditTask implements UseCase<EditTaskEntity, Either<Exception, Unit>> {
  IBoardRepository repository;

  EditTask(this.repository);

  @override
  Future<Either<Exception, Unit>> call(task) async {
    return await repository.editTask(
      oldTask: TaskDto.fromEntity(task.oldTask),
      newTask: TaskDto.fromEntity(task.newTask),
    );
  }
}
