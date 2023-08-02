import 'package:flutter/material.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/edit_note_body.dart';
import 'package:todo/theme.dart';

class EditNoteSheet extends StatelessWidget {
  final TodoModel note;
  const EditNoteSheet({
  super.key, required this.note,
  });


  @override
  Widget build(BuildContext context) {

    return
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppTheme.white,
                AppTheme.kBabyBlue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          ),
        ),
        child:   EditNoteBody(note: note),
      );
  }
}

