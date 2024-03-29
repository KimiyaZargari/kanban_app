import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/infrastructure/project/project_dto.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import 'package:mocktail/mocktail.dart';

class MockProjectsRepository extends Mock implements IProjectRepository {}

class FakeProject extends Fake implements ProjectDto {}

void main() {
  late ProjectsNotifier sut;
  late MockProjectsRepository mockProjectsRepository;
  setUpAll(() {
    registerFallbackValue(FakeProject());
  });

  setUp(() {
    mockProjectsRepository = MockProjectsRepository();
    sut = ProjectsNotifier(repository: mockProjectsRepository);
  });
  final projectsList = [
    ProjectDto(name: 'test1', inProgress: 0, todo: 0, done: 0),
    ProjectDto(name: 'test2', inProgress: 0, todo: 0, done: 0),
    ProjectDto(name: 'test3', inProgress: 0, todo: 0, done: 0),
  ];
  void arrangeProjectsRepositoryReturnsListOfProjects() {
    when(() => mockProjectsRepository.getProjects())
        .thenAnswer((invocation) async => projectsList);
  }

  group('get projects initial data and load page', () {
    test('get projects is called', () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      await sut.getProjects();
      verify(() => mockProjectsRepository.getProjects()).called(1);
    });
    test(
        'indicates loading data setting projects to the data that was loaded and finish loading',
        () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      final future = sut.getProjects();
      expect(sut.state, ProjectsState.initial());
      await future;
      expect(sut.projects, projectsList.map((e) => e.toEntity()).toList());
      expect(sut.state, ProjectsState.loaded());
    });
  });
  test('deleteProject', () async {
    void arrangeProjectsRepositoryReturnsVoid() {
      when(() => mockProjectsRepository.deleteProject(any()))
          .thenAnswer((invocation) {});
    }
    arrangeProjectsRepositoryReturnsListOfProjects();

    arrangeProjectsRepositoryReturnsVoid();
    await sut.deleteProject(1);
    verify(() => mockProjectsRepository.deleteProject(1)).called(1);
  });
}
