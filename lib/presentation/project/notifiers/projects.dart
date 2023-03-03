import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects.freezed.dart';

part 'projects_state.dart';

final projectsNotifierProvider =
    StateNotifierProvider<ProjectsNotifier, ProjectsState>(
        (ref) => ProjectsNotifier());

class ProjectsNotifier extends StateNotifier<ProjectsState> {
  ProjectsNotifier() : super(_Initial());
}
