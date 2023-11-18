import 'package:dartz/dartz.dart';
import 'package:kanban_app/infrastructure/board/task_dto.dart';

abstract class IBoardRepository {
  Future<Map<String, List<TaskDto>>> getBoardData(int projectId);

  Future<Either<Exception, int>> createTask(TaskDto task);

  Future<Either<Exception, Unit>> editTask({required TaskDto oldTask,required  TaskDto newTask});

  void deleteTask(int id);
}
