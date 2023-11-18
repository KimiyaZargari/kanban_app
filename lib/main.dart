import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:kanban_app/presentation/core/config/themes/dark_theme.dart';
import 'package:kanban_app/presentation/core/config/themes/light_theme.dart';
import 'package:kanban_app/presentation/core/config/themes/provider.dart';
import 'package:kanban_app/presentation/routes/router.dart';
import 'package:path_provider/path_provider.dart';

import 'infrastructure/core/local_database.dart';
import 'infrastructure/project/project_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  final projectsBox = await Hive.openBox<Map>(DatabaseKeys.projectKey);

  runApp(MyApp(projectsBox: projectsBox,));
}

class MyApp extends StatelessWidget {
  MyApp({required this.projectsBox, super.key});

  final Box<Map> projectsBox;
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        projectRepositoryProvider
            .overrideWithValue(ProjectRepository(projectsBox))
      ],
      child: Consumer(builder: (context, ref, _) {
        final themeMode = ref.watch(themeProvider);
        return MaterialApp.router(
            title: 'Flutter Demo',
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: themeMode,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser());
      }),
    );
  }
}
