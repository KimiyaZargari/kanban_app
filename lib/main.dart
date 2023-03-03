import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/config/themes/dark_theme.dart';
import 'package:kanban_app/presentation/routes/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: darkTheme(),
        routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser()
      ),
    );
  }
}
