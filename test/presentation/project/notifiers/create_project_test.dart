import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/presentation/project/notifiers/create_project.dart';
import 'package:mocktail/mocktail.dart';

class MockProjectsRepository extends Mock implements IProjectRepository {}

class FakeProject extends Fake implements ProjectModel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CreateProjectNotifier sut;
  late MockProjectsRepository mockProjectsRepository;
  setUpAll(() {
    registerFallbackValue(FakeProject());
  });

  setUp(() {
    mockProjectsRepository = MockProjectsRepository();
    sut = CreateProjectNotifier(repository: mockProjectsRepository);
  });

  group('create new project', () {
    final newProject =
        ProjectModel(name: 'new test', inProgress: 0, todo: 0, done: 0);
    final duplicateProject =
        ProjectModel(name: 'duplicate test', inProgress: 0, todo: 0, done: 0);
    void arrangeProjectsRepositoryCreateProject() {
      when(() => mockProjectsRepository.createProject(newProject))
          .thenAnswer((invocation) async => right(1));
      when(() => mockProjectsRepository.createProject(duplicateProject))
          .thenAnswer((invocation) async=> left(Exception('project duplicate')));
    }

    test('create new project is called once from repository', () async {
      arrangeProjectsRepositoryCreateProject();
      sut.projectName = newProject.name;
      await sut.createProject();
      verify(() => mockProjectsRepository.createProject(newProject)).called(1);
    });

    test(
        'when an error is occurred in the repository state should change to project exists',
        () async {
      arrangeProjectsRepositoryCreateProject();
      sut.projectName = duplicateProject.name;
      await sut.createProject();
      expect(sut.state, CreateProjectState.projectExists());
    });
    test(
        'when the repository finishes without error,state should change to created ',
        () async {
      arrangeProjectsRepositoryCreateProject();
      sut.projectName = newProject.name;
      await sut.createProject();
      expect(sut.state, CreateProjectState.created(1));
    });
  });
}
