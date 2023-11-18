import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_entity.dart';

import '../core/usecase.dart';

class GetBoardData implements UseCase<int, Map<String, List<TaskEntity>>> {
  IBoardRepository repository;

  GetBoardData(this.repository);

  @override
  Future<Map<String, List<TaskEntity>>> call(projectId) async {
    return (await repository.getBoardData(projectId)).map(
        (key, value) => MapEntry(key, value.map((e) => e.toEntity()).toList()));
  }
}
