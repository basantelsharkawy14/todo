import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/features/todo_tasks/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            List<TodoModel> notes = BlocProvider.of<NotesCubit>(context).notesFiltered!;
  return    ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding:const EdgeInsets.symmetric(horizontal: 20),
        itemCount: notes.length,
        itemBuilder: (context, index) =>
            TaskItem(note: notes[index],)
    );});
  }
}
