import 'package:kanban_app/domain/board/i_board_repository.dart';

import '../../domain/board/task_model.dart';
import '../core/usecase.dart';

class GetBoardData implements UseCase<int, Map<String, List<TaskModel>>> {
  IBoardRepository repository;

  GetBoardData(this.repository);

  @override
  Future<Map<String, List<TaskModel>>> call(projectId) async {
    return repository.getBoardData(projectId);
  }
}
