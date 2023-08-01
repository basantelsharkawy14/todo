import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:todo/features/todo_tasks/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/add_note_sheet.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/todo_view_body.dart';
import 'package:todo/theme.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Scaffold(
      body: const TodoViewBody(),
     floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalSideSheet(
            width: size.width * .85,
              context: context,
              ignoreAppBar: true,
              body: BlocProvider(
                create:  (context) => AddNoteCubit(),
                  child: const AddNoteSheet())
          );
       },
        tooltip: 'Increment',
        child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  AppTheme.kLightBlue,
                  AppTheme.kDarkBlue,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter
              ),
            ),
            child: const Icon(Icons.add, color: Colors.white,size: 26,)),
      ),
    );
  }
}


