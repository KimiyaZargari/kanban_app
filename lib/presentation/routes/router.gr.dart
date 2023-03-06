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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../project/screens/create_project.dart' as _i2;
import '../project/screens/projects.dart' as _i1;
import '../project_board/screens/project_board.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ProjectsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProjectsPage(),
      );
    },
    CreateProjectRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CreateProjectPage(),
      );
    },
    ProjectBoardRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProjectBoardRouteArgs>(
          orElse: () => ProjectBoardRouteArgs(id: pathParams.getInt('id')));
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProjectBoardPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/projects',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          ProjectsRoute.name,
          path: '/projects',
        ),
        _i4.RouteConfig(
          CreateProjectRoute.name,
          path: '/create_projects',
        ),
        _i4.RouteConfig(
          ProjectBoardRoute.name,
          path: 'projects/:id',
        ),
      ];
}

/// generated route for
/// [_i1.ProjectsPage]
class ProjectsRoute extends _i4.PageRouteInfo<void> {
  const ProjectsRoute()
      : super(
          ProjectsRoute.name,
          path: '/projects',
        );

  static const String name = 'ProjectsRoute';
}

/// generated route for
/// [_i2.CreateProjectPage]
class CreateProjectRoute extends _i4.PageRouteInfo<void> {
  const CreateProjectRoute()
      : super(
          CreateProjectRoute.name,
          path: '/create_projects',
        );

  static const String name = 'CreateProjectRoute';
}

/// generated route for
/// [_i3.ProjectBoardPage]
class ProjectBoardRoute extends _i4.PageRouteInfo<ProjectBoardRouteArgs> {
  ProjectBoardRoute({
    required int id,
    _i5.Key? key,
  }) : super(
          ProjectBoardRoute.name,
          path: 'projects/:id',
          args: ProjectBoardRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'ProjectBoardRoute';
}

class ProjectBoardRouteArgs {
  const ProjectBoardRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ProjectBoardRouteArgs{id: $id, key: $key}';
  }
}
