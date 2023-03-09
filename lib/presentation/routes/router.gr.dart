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
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../board/screens/board.dart' as _i3;
import '../board/screens/create_task.dart' as _i4;
import '../project/screens/create_project.dart' as _i2;
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
    CreateProjectRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CreateProjectPage(),
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
    CreateTaskRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateTaskRouteArgs>(
          orElse: () =>
              CreateTaskRouteArgs(projectId: pathParams.getInt('id')));
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CreateTaskPage(
          projectId: args.projectId,
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
          CreateProjectRoute.name,
          path: '/create_projects',
        ),
        _i5.RouteConfig(
          ProjectBoardRoute.name,
          path: 'board/:id',
        ),
        _i5.RouteConfig(
          CreateTaskRoute.name,
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
/// [_i2.CreateProjectPage]
class CreateProjectRoute extends _i5.PageRouteInfo<void> {
  const CreateProjectRoute()
      : super(
          CreateProjectRoute.name,
          path: '/create_projects',
        );

  static const String name = 'CreateProjectRoute';
}

/// generated route for
/// [_i3.ProjectBoardPage]
class ProjectBoardRoute extends _i5.PageRouteInfo<ProjectBoardRouteArgs> {
  ProjectBoardRoute({
    required int id,
    String projectName = 'Board',
    _i7.Key? key,
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

  final _i7.Key? key;

  @override
  String toString() {
    return 'ProjectBoardRouteArgs{id: $id, projectName: $projectName, key: $key}';
  }
}

/// generated route for
/// [_i4.CreateTaskPage]
class CreateTaskRoute extends _i5.PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute({
    required int projectId,
    _i7.Key? key,
  }) : super(
          CreateTaskRoute.name,
          path: 'board/:id/create_task',
          args: CreateTaskRouteArgs(
            projectId: projectId,
            key: key,
          ),
          rawPathParams: {'id': projectId},
        );

  static const String name = 'CreateTaskRoute';
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs({
    required this.projectId,
    this.key,
  });

  final int projectId;

  final _i7.Key? key;

  @override
  String toString() {
    return 'CreateTaskRouteArgs{projectId: $projectId, key: $key}';
  }
}
