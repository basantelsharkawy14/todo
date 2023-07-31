import 'package:flutter/material.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/tasks_list.dart';
import 'package:todo/theme.dart';

class TodoViewBody extends StatelessWidget {
  const TodoViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      // height: size.height,
     // width: size.width,
      decoration:  BoxDecoration(
          gradient:  LinearGradient(
            colors: <Color>[
              AppTheme.kGridLinesYellowColor.withOpacity(.3),
              AppTheme.kGridLinesPinkColor.withOpacity(.3),
              AppTheme.kGridLinesBlueColor.withOpacity(.3),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight
          ),
      ),
      child: const SafeArea(
        child: Column(
          children: [
            Text('TODO', style: Styles.textStyle30),
            TasksList()
          ],
        ),
      ),
    );
  }
}
