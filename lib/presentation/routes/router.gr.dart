// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../domain/board/task_model.dart' as _i10;
import '../../domain/project/project_model.dart' as _i9;
import '../auth/screens/login.dart' as _i2;
import '../board/screens/board.dart' as _i5;
import '../board/screens/create_edit_task.dart' as _i6;
import '../project/screens/create_edit_project.dart' as _i4;
import '../project/screens/projects.dart' as _i3;
import '../splash/screen/splash.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    ProjectsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ProjectsPage(),
      );
    },
    CreateEditProjectRoute.name: (routeData) {
      final args = routeData.argsAs<CreateEditProjectRouteArgs>(
          orElse: () => const CreateEditProjectRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CreateEditProjectPage(
          project: args.project,
          key: args.key,
        ),
      );
    },
    ProjectBoardRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ProjectBoardRouteArgs>(
          orElse: () => ProjectBoardRouteArgs(
                id: pathParams.getInt('id'),
                projectName: queryParams.getString(
                  'projectName',
                  'Board',
                ),
              ));
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ProjectBoardPage(
          id: args.id,
          projectName: args.projectName,
          key: args.key,
        ),
      );
    },
    CreateEditTaskRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateEditTaskRouteArgs>(
          orElse: () =>
              CreateEditTaskRouteArgs(projectId: pathParams.getInt('id')));
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.CreateEditTaskPage(
          projectId: args.projectId,
          task: args.task,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i7.RouteConfig(
          ProjectsRoute.name,
          path: '/projects',
        ),
        _i7.RouteConfig(
          CreateEditProjectRoute.name,
          path: '/create_projects',
        ),
        _i7.RouteConfig(
          ProjectBoardRoute.name,
          path: 'board/:id',
        ),
        _i7.RouteConfig(
          CreateEditTaskRoute.name,
          path: 'board/:id/create_task',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.ProjectsPage]
class ProjectsRoute extends _i7.PageRouteInfo<void> {
  const ProjectsRoute()
      : super(
          ProjectsRoute.name,
          path: '/projects',
        );

  static const String name = 'ProjectsRoute';
}

/// generated route for
/// [_i4.CreateEditProjectPage]
class CreateEditProjectRoute
    extends _i7.PageRouteInfo<CreateEditProjectRouteArgs> {
  CreateEditProjectRoute({
    _i9.ProjectModel? project,
    _i8.Key? key,
  }) : super(
          CreateEditProjectRoute.name,
          path: '/create_projects',
          args: CreateEditProjectRouteArgs(
            project: project,
            key: key,
          ),
        );

  static const String name = 'CreateEditProjectRoute';
}

class CreateEditProjectRouteArgs {
  const CreateEditProjectRouteArgs({
    this.project,
    this.key,
  });

  final _i9.ProjectModel? project;

  final _i8.Key? key;

  @override
  String toString() {
    return 'CreateEditProjectRouteArgs{project: $project, key: $key}';
  }
}

/// generated route for
/// [_i5.ProjectBoardPage]
class ProjectBoardRoute extends _i7.PageRouteInfo<ProjectBoardRouteArgs> {
  ProjectBoardRoute({
    required int id,
    String projectName = 'Board',
    _i8.Key? key,
  }) : super(
          ProjectBoardRoute.name,
          path: 'board/:id',
          args: ProjectBoardRouteArgs(
            id: id,
            projectName: projectName,
            key: key,
          ),
          rawPathParams: {'id': id},
          rawQueryParams: {'projectName': projectName},
        );

  static const String name = 'ProjectBoardRoute';
}

class ProjectBoardRouteArgs {
  const ProjectBoardRouteArgs({
    required this.id,
    this.projectName = 'Board',
    this.key,
  });

  final int id;

  final String projectName;

  final _i8.Key? key;

  @override
  String toString() {
    return 'ProjectBoardRouteArgs{id: $id, projectName: $projectName, key: $key}';
  }
}

/// generated route for
/// [_i6.CreateEditTaskPage]
class CreateEditTaskRoute extends _i7.PageRouteInfo<CreateEditTaskRouteArgs> {
  CreateEditTaskRoute({
    required int projectId,
    _i10.TaskModel? task,
    _i8.Key? key,
  }) : super(
          CreateEditTaskRoute.name,
          path: 'board/:id/create_task',
          args: CreateEditTaskRouteArgs(
            projectId: projectId,
            task: task,
            key: key,
          ),
          rawPathParams: {'id': projectId},
        );

  static const String name = 'CreateEditTaskRoute';
}

class CreateEditTaskRouteArgs {
  const CreateEditTaskRouteArgs({
    required this.projectId,
    this.task,
    this.key,
  });

  final int projectId;

  final _i10.TaskModel? task;

  final _i8.Key? key;

  @override
  String toString() {
    return 'CreateEditTaskRouteArgs{projectId: $projectId, task: $task, key: $key}';
  }
}
