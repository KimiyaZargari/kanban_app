import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/domain/project/project_model.dart';

final projectsBoxProvider = FutureProvider.autoDispose<Box<ProjectModel>>(
    (ref) => Hive.openBox(DatabaseKeys.projectKey));

class DatabaseKeys {
  DatabaseKeys._();

  static const projectKey = 'KEY_PROJECT', boardKey = 'KEY_BOARD';

// openProjects() async {
//   final projectsBox =
//       await Hive.openBox<ProjectModel>(DatabaseKeys.projectKey);
// }
}
