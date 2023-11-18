import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_entity.dart';
import 'package:kanban_app/infrastructure/board/task_dto.dart';
import 'package:kanban_app/domain/core/enums.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:mocktail/mocktail.dart';

class MockBoardsRepository extends Mock implements IBoardRepository {}

class FakeTask extends Fake implements TaskDto {}

void main() {
  late BoardNotifier sut;
  late MockBoardsRepository mockBoardsRepository;
  late Map<String, List<TaskEntity>> boardData;
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
      when(() => mockBoardsRepository.getBoardData(any())).thenAnswer(
          (invocation) async => boardData.map((key, value) =>
              MapEntry(key, value.map((e) => TaskDto.fromEntity(e)).toList())));
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
  group('delete task', () {
    setUp(() {
      sut.tasks = boardData;
    });

    final toDoTask =
        TaskDto(title: 'to do test', status: TaskStatus.toDo.toString());

    void arrangeProjectsRepositoryReturnsListOfProjects() {
      when(() => mockBoardsRepository.deleteTask(any()))
          .thenAnswer((invocation) {});
    }

    test('indicates that notifier requests repository to delete task',
        () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      await sut.deleteTask(toDoTask.copyWith(id: 1).toEntity());
      verify(() => mockBoardsRepository.deleteTask(1)).called(1);
    });
    test('indicates that task is removed from board after deletion', () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      sut.tasks = {
        'To Do': [toDoTask.copyWith(id: 1).toEntity(), toDoTask.copyWith(id: 2).toEntity()],
      };
      await sut.deleteTask(toDoTask.copyWith(id: 1).toEntity());
      expect(sut.tasks[TaskStatus.toDo.toString()], [toDoTask.copyWith(id: 2).toEntity()]);
    });
  });

}
