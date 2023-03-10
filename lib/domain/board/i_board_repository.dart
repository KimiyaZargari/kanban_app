import 'package:dartz/dartz.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/domain/project/project_model.dart';

abstract class IBoardRepository {
  Future<Map<String, List<TaskModel>>> getBoardData(int projectId);

  Future<Either<Exception, int>> createTask(TaskModel task);

  Future<Either<Exception, Unit>> editTask(EditTaskModel task);

  void deleteTask(int id);
}
