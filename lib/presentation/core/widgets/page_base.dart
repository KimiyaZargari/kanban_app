import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanban_app/presentation/core/config/themes/provider.dart';


class PageBase extends StatelessWidget {
  final Widget child;
  final String title;
  final FloatingActionButton? floatingActionButton;
  final Widget? extraActionButton;
  final Widget? leadingButton;

  const PageBase(
      {required this.title,
      required this.child,
      this.extraActionButton,
      this.floatingActionButton,
      this.leadingButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: leadingButton,
          toolbarHeight: 80,
          title: Text(title),
          actions: [
            Consumer(builder: (context, ref, _) {
              return IconButton(
                  onPressed: () {
                    final themeNotifier = ref.read(themeProvider.notifier);
                    if (themeNotifier.state == ThemeMode.dark) {
                      themeNotifier.state = ThemeMode.light;
                    } else {
                      themeNotifier.state = ThemeMode.dark;
                    }
                  },
                  icon: const Icon(Icons.color_lens_rounded));
            }),
        if (extraActionButton != null) extraActionButton!,

          ],
        ),
        body: child,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
