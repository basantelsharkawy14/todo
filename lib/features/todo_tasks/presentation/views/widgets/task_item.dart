import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/edit_note_sheet.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key,required this.note}) : super(key: key);
final TodoModel note;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        showModalSideSheet(
            barrierDismissible:true,
            width: size.width * .85,
            context: context,
            ignoreAppBar: true,
            body:  EditNoteSheet(note: note)
        );
      },
      child: Container(
        height: 53,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             CircleAvatar(
              radius: 12,
              backgroundColor: Color(note.color),
            ),
            const SizedBox(width: 5,),
            SizedBox(
              width: size.width * .44,
              child:  Text(note.description.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14),
            ),

             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(  DateFormat('dd-MMMM').format(DateTime.parse(note.date)).toString(),
                style: Styles.textStyle12),
                Text(note.time,
                    style: Styles.textStyle10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
