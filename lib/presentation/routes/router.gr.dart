// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i8;
import 'package:kanban_app/domain/board/task_entity.dart' as _i9;
import 'package:kanban_app/domain/project/project_entity.dart' as _i7;
import 'package:kanban_app/presentation/board/screens/board.dart' as _i3;
import 'package:kanban_app/presentation/board/screens/create_edit_task.dart'
    as _i2;
import 'package:kanban_app/presentation/project/screens/create_edit_project.dart'
    as _i1;
import 'package:kanban_app/presentation/project/screens/projects.dart' as _i4;
import 'package:kanban_app/presentation/splash/screen/splash.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CreateEditProjectRoute.name: (routeData) {
      final args = routeData.argsAs<CreateEditProjectRouteArgs>(
          orElse: () => const CreateEditProjectRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CreateEditProjectPage(
          project: args.project,
          key: args.key,
        ),
      );
    },
    CreateEditTaskRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreateEditTaskRouteArgs>(
          orElse: () =>
              CreateEditTaskRouteArgs(projectId: pathParams.getInt('id')));
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CreateEditTaskPage(
          projectId: args.projectId,
          task: args.task,
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
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ProjectBoardPage(
          id: args.id,
          projectName: args.projectName,
          key: args.key,
        ),
      );
    },
    ProjectsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProjectsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateEditProjectPage]
class CreateEditProjectRoute
    extends _i6.PageRouteInfo<CreateEditProjectRouteArgs> {
  CreateEditProjectRoute({
    _i7.ProjectEntity? project,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CreateEditProjectRoute.name,
          args: CreateEditProjectRouteArgs(
            project: project,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateEditProjectRoute';

  static const _i6.PageInfo<CreateEditProjectRouteArgs> page =
      _i6.PageInfo<CreateEditProjectRouteArgs>(name);
}

class CreateEditProjectRouteArgs {
  const CreateEditProjectRouteArgs({
    this.project,
    this.key,
  });

  final _i7.ProjectEntity? project;

  final _i8.Key? key;

  @override
  String toString() {
    return 'CreateEditProjectRouteArgs{project: $project, key: $key}';
  }
}

/// generated route for
/// [_i2.CreateEditTaskPage]
class CreateEditTaskRoute extends _i6.PageRouteInfo<CreateEditTaskRouteArgs> {
  CreateEditTaskRoute({
    required int projectId,
    _i9.TaskEntity? task,
    _i10.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CreateEditTaskRoute.name,
          args: CreateEditTaskRouteArgs(
            projectId: projectId,
            task: task,
            key: key,
          ),
          rawPathParams: {'id': projectId},
          initialChildren: children,
        );

  static const String name = 'CreateEditTaskRoute';

  static const _i6.PageInfo<CreateEditTaskRouteArgs> page =
      _i6.PageInfo<CreateEditTaskRouteArgs>(name);
}

class CreateEditTaskRouteArgs {
  const CreateEditTaskRouteArgs({
    required this.projectId,
    this.task,
    this.key,
  });

  final int projectId;

  final _i9.TaskEntity? task;

  final _i10.Key? key;

  @override
  String toString() {
    return 'CreateEditTaskRouteArgs{projectId: $projectId, task: $task, key: $key}';
  }
}

/// generated route for
/// [_i3.ProjectBoardPage]
class ProjectBoardRoute extends _i6.PageRouteInfo<ProjectBoardRouteArgs> {
  ProjectBoardRoute({
    required int id,
    String projectName = 'Board',
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ProjectBoardRoute.name,
          args: ProjectBoardRouteArgs(
            id: id,
            projectName: projectName,
            key: key,
          ),
          rawPathParams: {'id': id},
          rawQueryParams: {'projectName': projectName},
          initialChildren: children,
        );

  static const String name = 'ProjectBoardRoute';

  static const _i6.PageInfo<ProjectBoardRouteArgs> page =
      _i6.PageInfo<ProjectBoardRouteArgs>(name);
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
/// [_i4.ProjectsPage]
class ProjectsRoute extends _i6.PageRouteInfo<void> {
  const ProjectsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProjectsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjectsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
