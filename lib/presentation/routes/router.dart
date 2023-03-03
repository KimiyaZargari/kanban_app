import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:kanban_app/presentation/project/screens/projects.dart';
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/projects', page: ProjectsPage, initial: true),
  ],
)
class $AppRouter {}
