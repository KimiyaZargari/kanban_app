import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/domain/project/project_model.dart';

import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class EditTask implements UseCase<EditTaskModel, Either<Exception, Unit>> {
  IBoardRepository repository;

  EditTask(this.repository);

  @override
  Future<Either<Exception, Unit>> call(task) async{
    return await repository.editTask(task);
  }
}
