import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/features/todo_tasks/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/add_note_form.dart';
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
      // BlocConsumer<AddNoteCubit, AddNoteState>(
      //     listener: (context, state) {
      //       if (state is AddNoteFailure) {}
      //
      //       if (state is AddNoteSuccess) {
      //         BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      //         Navigator.pop(context);
      //       }
      //     },
      //     builder: (context, state) =>
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
          //    )
    );
  }
}

