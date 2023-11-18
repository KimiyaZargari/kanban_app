import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/core/enums.dart';
import 'package:kanban_app/infrastructure/board/task_dto.dart';
import 'package:kanban_app/presentation/board/notifiers/create_edit_task.dart';
import 'package:mocktail/mocktail.dart';

class MockBoardsRepository extends Mock implements IBoardRepository {}

class FakeTask extends Fake implements TaskDto {}

void main() {
  late CreateTaskNotifier sut;
  late MockBoardsRepository mockBoardsRepository;
  setUpAll(() {
    registerFallbackValue(FakeTask());
  });

  setUp(() {
    mockBoardsRepository = MockBoardsRepository();
    sut = CreateTaskNotifier(repository: mockBoardsRepository, projectId: 1);

  });

  group('create task', () {
    final toDoTask =
        TaskDto(title: 'to do test', status: TaskStatus.toDo.toString());

    final inProgressTaskWithoutTimer = TaskDto(
      title: 'in progress test',
      status: TaskStatus.inProgress.toString(),
    );
    final inProgressTaskWithTimer = TaskDto(
        title: 'in progress test',
        status: TaskStatus.inProgress.toString(),
        intervals: []);
    final doneTask = TaskDto(
        title: 'done test',
        status: TaskStatus.done.toString(),
        completedAt: DateTime.now());

    void arrangeProjectsRepositoryCreatesTask() {
      when(() => mockBoardsRepository.createTask(any()))
          .thenAnswer((invocation) async => right(1));
    }

    test('indicates that notifier requests repository to create task',
        () async {
      arrangeProjectsRepositoryCreatesTask();
      await sut.createTask(toDoTask.toEntity(), false);
      verify(() => mockBoardsRepository.createTask(toDoTask)).called(1);
    });
  });

  group('edit task', () {
    final oldTask =
        TaskDto(id: 1, title: 'old', status: TaskStatus.toDo.toString());
    final newTask =
        TaskDto(id: 1, title: 'new', status: TaskStatus.toDo.toString());

    void arrangeProjectsRepositoryEditsTask() {
      when(() => mockBoardsRepository.editTask(oldTask: oldTask, newTask: newTask))
          .thenAnswer((invocation) async => right(unit));
    }
    test('indicates that notifier requests repository to edit task', () async {
      arrangeProjectsRepositoryEditsTask();
      await sut.editTask(
          oldTask.toEntity(), newTask.title, newTask.description);
      verify(() =>
              mockBoardsRepository.editTask(oldTask: oldTask, newTask: newTask))
          .called(1);
    });
  });
}
