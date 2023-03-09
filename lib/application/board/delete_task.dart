import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/domain/project/project_model.dart';

import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class DeleteTask implements UseCase<int, void> {
  IBoardRepository repository;

  DeleteTask(this.repository);

  @override
  Future<void> call(id) async {
    return repository.deleteTask(id);
  }
}
