import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/projects', page: ProjectsRoute.page),
        AutoRoute(path: '/create_projects', page: CreateEditProjectRoute.page),
        AutoRoute(path: '/board/:id', page: ProjectBoardRoute.page),
        AutoRoute(
            path: '/board/:id/create_task', page: CreateEditTaskRoute.page),
      ];
}
