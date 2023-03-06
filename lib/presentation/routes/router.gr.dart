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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../project/screens/create_project.dart' as _i2;
import '../project/screens/projects.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ProjectsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProjectsPage(),
      );
    },
    CreateProjectRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CreateProjectPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/projects',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          ProjectsRoute.name,
          path: '/projects',
        ),
        _i3.RouteConfig(
          CreateProjectRoute.name,
          path: '/create_projects',
        ),
      ];
}

/// generated route for
/// [_i1.ProjectsPage]
class ProjectsRoute extends _i3.PageRouteInfo<void> {
  const ProjectsRoute()
      : super(
          ProjectsRoute.name,
          path: '/projects',
        );

  static const String name = 'ProjectsRoute';
}

/// generated route for
/// [_i2.CreateProjectPage]
class CreateProjectRoute extends _i3.PageRouteInfo<void> {
  const CreateProjectRoute()
      : super(
          CreateProjectRoute.name,
          path: '/create_projects',
        );

  static const String name = 'CreateProjectRoute';
}
