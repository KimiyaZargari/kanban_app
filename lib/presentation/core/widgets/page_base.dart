import 'package:flutter/material.dart';

class PageBase extends StatelessWidget {
  final Widget child;
  final String title;
  final FloatingActionButton? floatingActionButton;

  const PageBase(
      {required this.title,
      required this.child,
      this.floatingActionButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
