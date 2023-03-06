import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanban_app/presentation/core/widgets/page_base.dart';

class ProjectBoardPage extends StatelessWidget {
  const ProjectBoardPage({@pathParam required int id, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBase(
        title: 'Board',
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('To Do'),
                )),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('In Progress'),
                )),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Done'),
                )),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Column(
                      children: [],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
