import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:mocktail/mocktail.dart';

class MockBoardsRepository extends Mock implements IBoardRepository {}

class FakeTask extends Fake implements EditTaskModel {}

void main() {
  late BoardNotifier sut;
  late MockBoardsRepository mockBoardsRepository;
  late Map<String, List<TaskModel>> boardData;
  setUpAll(() {
    registerFallbackValue(FakeTask());
  });

  setUp(() {
    mockBoardsRepository = MockBoardsRepository();
    sut = BoardNotifier(repository: mockBoardsRepository, projectId: 1);
    boardData = {
      TaskStatus.toDo.toString(): [],
      TaskStatus.inProgress.toString(): [],
      TaskStatus.done.toString(): [],
    };
  });

  group('get project\'s initial data and load page', () {
    void arrangeProjectsRepositoryReturnsListOfProjects() {
      when(() => mockBoardsRepository.getBoardData(any()))
          .thenAnswer((invocation) async => boardData);
    }

    test('indicates that notifier requests board data from repository',
        () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      await sut.getData();
      verify(() => mockBoardsRepository.getBoardData(sut.projectId)).called(1);
    });
    test(
        'indicates that data fetched from repository is set and page is loaded',
        () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      await sut.getData();
      expect(sut.tasks, boardData);
      expect(sut.state, BoardState.loaded());
    });
  });
  group('create task', () {
    setUp(() {
      sut.tasks = boardData;
    });

    final toDoTask =
        TaskModel(title: 'to do test', status: TaskStatus.toDo.toString());

    final inProgressTaskWithoutTimer = TaskModel(
      title: 'in progress test',
      status: TaskStatus.inProgress.toString(),
    );
    final inProgressTaskWithTimer = TaskModel(
        title: 'in progress test',
        status: TaskStatus.inProgress.toString(),
        intervals: []);
    final doneTask = TaskModel(
        title: 'done test',
        status: TaskStatus.done.toString(),
        completedAt: DateTime.now());

    void arrangeProjectsRepositoryReturnsListOfProjects() {
      when(() => mockBoardsRepository.createTask(any()))
          .thenAnswer((invocation) async => right(1));
    }

    test('indicates that notifier requests repository to create task',
        () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      await sut.createTask(toDoTask);
      verify(() => mockBoardsRepository.createTask(toDoTask)).called(1);
    });
    test('indicates that created task is added to board', () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      await sut.createTask(toDoTask);
      expect(sut.tasks[TaskStatus.toDo.toString()]!.last, toDoTask);
    });
  });
}
