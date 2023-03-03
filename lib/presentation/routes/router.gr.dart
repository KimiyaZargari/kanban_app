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
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../project/screens/projects.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    ProjectsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProjectsPage(),
      );
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/projects',
          fullMatch: true,
        ),
        _i2.RouteConfig(
          ProjectsRoute.name,
          path: '/projects',
        ),
      ];
}

/// generated route for
/// [_i1.ProjectsPage]
class ProjectsRoute extends _i2.PageRouteInfo<void> {
  const ProjectsRoute()
      : super(
          ProjectsRoute.name,
          path: '/projects',
        );

  static const String name = 'ProjectsRoute';
}
