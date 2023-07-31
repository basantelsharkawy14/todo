import 'package:flutter/material.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/todo_view_body.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TodoViewBody(),
    );
  }
}
