import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/domain/project/i_project_repository.dart';
import 'package:kanban_app/domain/project/project_model.dart';
import 'package:kanban_app/infrastructure/project/project_repository.dart';
import 'package:kanban_app/presentation/project/notifiers/projects.dart';
import 'package:mocktail/mocktail.dart';

class MockProjectsRepository extends Mock implements IProjectRepository {}

void main() {
  late ProjectsNotifier sut;
  late MockProjectsRepository mockProjectsRepository;
  setUp(() {
    mockProjectsRepository = MockProjectsRepository();
    sut = ProjectsNotifier(repository: mockProjectsRepository);
  });

  group('get projects initial data and load page', () {
    final projectsList = [
      ProjectModel(name: 'test1', todo: 0, inProgress: 0, done: 0),
      ProjectModel(name: 'test2', todo: 0, inProgress: 0, done: 0),
      ProjectModel(name: 'test3', todo: 0, inProgress: 0, done: 0),
    ];
    void arrangeProjectsRepositoryReturnsListOfProjects() {
      when(() => mockProjectsRepository.getProjects())
          .thenAnswer((invocation) => projectsList);
    }


    test('gets projects', () async {
      arrangeProjectsRepositoryReturnsListOfProjects();
      await sut.getProjects();
      verify(() => mockProjectsRepository.getProjects()).called(1);
    });

  });
}
