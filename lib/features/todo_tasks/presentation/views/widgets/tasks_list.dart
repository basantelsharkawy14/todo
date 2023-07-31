import 'package:flutter/material.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding:const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 3,
        itemBuilder: (context, index) =>
          const  TaskItem()
    );
  }
}
