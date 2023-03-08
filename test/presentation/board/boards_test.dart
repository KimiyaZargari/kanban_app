import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/board/i_board_repository.dart';
import 'package:kanban_app/domain/board/task_model.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/presentation/board/notifiers/board.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import 'package:mocktail/mocktail.dart';

class MockBoardsRepository extends Mock implements IBoardRepository {}

void main() {
  late BoardNotifier sut;
  late MockBoardsRepository mockBoardsRepository;


  setUp(() {
    mockBoardsRepository = MockBoardsRepository();
    sut = BoardNotifier(repository: mockBoardsRepository, projectId: 1);
  });

  group('get project\'s initial data and load page', () {
    final boardData = {
      'To Do': [
        TaskModel(
            name: 'test',
            status: 'ToDo',
            intervals: [],
            completedAt: DateTime.now()),
      ],
    };
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
}
