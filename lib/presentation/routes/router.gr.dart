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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:flutter/material.dart' as _i6;

import '../../domain/board/task_model.dart' as _i9;
import '../../domain/project/project_model.dart' as _i7;
import '../board/screens/board.dart' as _i3;
import '../board/screens/create_edit_task.dart' as _i4;
import '../project/screens/create_edit_project.dart' as _i2;
import '../project/screens/projects.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ProjectsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProjectsPage(),
      );
    },
    CreateEditProjectRoute.name: (routeData) {
      final args = routeData.argsAs<CreateEditProjectRouteArgs>(
          orElse: () => const CreateEditProjectRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CreateEditProjectPage(
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
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProjectBoardPage(
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
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CreateEditTaskPage(
          projectId: args.projectId,
          task: args.task,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/projects',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          ProjectsRoute.name,
          path: '/projects',
        ),
        _i5.RouteConfig(
          CreateEditProjectRoute.name,
          path: '/create_projects',
        ),
        _i5.RouteConfig(
          ProjectBoardRoute.name,
          path: 'board/:id',
        ),
        _i5.RouteConfig(
          CreateEditTaskRoute.name,
          path: 'board/:id/create_task',
        ),
      ];
}

/// generated route for
/// [_i1.ProjectsPage]
class ProjectsRoute extends _i5.PageRouteInfo<void> {
  const ProjectsRoute()
      : super(
          ProjectsRoute.name,
          path: '/projects',
        );

  static const String name = 'ProjectsRoute';
}

/// generated route for
/// [_i2.CreateEditProjectPage]
class CreateEditProjectRoute
    extends _i5.PageRouteInfo<CreateEditProjectRouteArgs> {
  CreateEditProjectRoute({
    _i7.ProjectModel? project,
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

  final _i7.ProjectModel? project;

  final _i8.Key? key;

  @override
  String toString() {
    return 'CreateEditProjectRouteArgs{project: $project, key: $key}';
  }
}

/// generated route for
/// [_i3.ProjectBoardPage]
class ProjectBoardRoute extends _i5.PageRouteInfo<ProjectBoardRouteArgs> {
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
/// [_i4.CreateEditTaskPage]
class CreateEditTaskRoute extends _i5.PageRouteInfo<CreateEditTaskRouteArgs> {
  CreateEditTaskRoute({
    required int projectId,
    _i9.TaskModel? task,
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

  final _i9.TaskModel? task;

  final _i8.Key? key;

  @override
  String toString() {
    return 'CreateEditTaskRouteArgs{projectId: $projectId, task: $task, key: $key}';
  }
}
