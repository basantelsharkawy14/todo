import 'package:flutter/material.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/todo_view_body.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TodoViewBody(),
  //    floatingActionButton: FloatingActionButton(
    //     onPressed: ,
    //  //   (){
    //       // showModalSideSheet(
    //       //     context: context,
    //       //     ignoreAppBar: false,
    //       //     body: ListView.builder(
    //       //       itemBuilder: (context, index) {
    //       //         return ListTile(
    //       //           leading: Icon(Icons.face),
    //       //           title: Text("I am on $index index"),
    //       //           trailing: Icon(Icons.safety_divider),
    //       //         );
    //       //       },
    //       //     ));
    // //    },
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ),
    );
  }
}
