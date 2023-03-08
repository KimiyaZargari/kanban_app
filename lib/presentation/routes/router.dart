import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:kanban_app/presentation/board/screens/create_task.dart';
import 'package:kanban_app/presentation/project/screens/create_project.dart';
import 'package:kanban_app/presentation/project/screens/projects.dart';
import 'package:kanban_app/presentation/board/screens/board.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/projects', page: ProjectsPage, initial: true),
    AutoRoute(path: '/create_projects', page: CreateProjectPage),
    AutoRoute(path: 'board/:id', page: ProjectBoardPage),
    AutoRoute(path: 'board/:id/create_task', page: CreateTaskPage),
  ],
)
class $AppRouter {}
