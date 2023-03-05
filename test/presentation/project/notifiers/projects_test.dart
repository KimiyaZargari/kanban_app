import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import 'package:mocktail/mocktail.dart';

class MockProjectsRepository extends Mock implements IProjectRepository {}

class FakeProject extends Fake implements ProjectModel {}

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

  group('get projects initial data and load page', () {
    final projectsList = [
      ProjectModel(name: 'test1', numberOfTasks: 0),
      ProjectModel(name: 'test2', numberOfTasks: 0),
      ProjectModel(name: 'test3', numberOfTasks: 0),
    ];
    void arrangeProjectsRepositoryReturnsListOfProjects() {
      when(() => mockProjectsRepository.getProjects())
          .thenAnswer((invocation) => projectsList);
    }

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
      expect(sut.projects, projectsList);
      expect(sut.state, ProjectsState.loaded());
    });
  });
  group('create project and reload page', () {
    const projectName = 'test';
    void arrangeProjectsRepositoryCreateProject() {
      when(() => mockProjectsRepository.createProject(any()))
          .thenAnswer((invocation) {});
      when(() => mockProjectsRepository.getProjects()).thenAnswer(
          (invocation) => [ProjectModel(name: projectName, numberOfTasks: 0)]);
    }

    test('create project is called with project name and 0 tasks', () async {
      arrangeProjectsRepositoryCreateProject();
      await sut.createProject(projectName);
      verify(() => mockProjectsRepository.createProject(
          ProjectModel(name: projectName, numberOfTasks: 0))).called(1);
    });
    test(
        'get projects is called after project creation is finished to get new list of projects',
        () async {
      arrangeProjectsRepositoryCreateProject();
      await sut.createProject(projectName);
      verify(() => mockProjectsRepository.getProjects()).called(1);
    });
  });
}
