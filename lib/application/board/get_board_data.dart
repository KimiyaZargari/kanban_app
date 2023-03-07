import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/core/no_param.dart';
import 'package:kanban_app/domain/project/project_model.dart';

import '../../domain/board/task_model.dart';
import '../../domain/project/i_project_repository.dart';
import '../core/usecase.dart';

class GetBoardData implements UseCase<int, Map<String, List<TaskModel>>> {
  IBoardRepository repository;

  GetBoardData(this.repository);

  @override
  Future<Map<String, List<TaskModel>>> call(projectId) async {
    return repository.getBoardData(projectId);
  }
}
