import 'package:flutter/material.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/filter_side_sheet.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/tasks_list.dart';
import 'package:todo/theme.dart';

class TodoViewBody extends StatelessWidget {
  const TodoViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
       height: size.height,
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
      child:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                   const Text('TODO', style: Styles.textStyle30),
                    GestureDetector(
                      onTap: (){
                        showModalSideSheet(
                            width: size.width * .85,
                            context: context,
                            ignoreAppBar: true,
                            body: const FilterSideSheet());
                      },
                        child: const Icon(Icons.filter_list))
                  ],
                ),
              ),
             const SizedBox( height: 30,),
            const  TasksList()
            ],
          ),
        ),
      ),
    );

  }
}
