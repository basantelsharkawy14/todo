import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/core/widgets/default_button.dart';
import 'package:todo/core/widgets/shimmer_loading.dart';
import 'package:todo/features/login/presentation/views/login_view.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/features/todo_tasks/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/task_item.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/token_invaled.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return
      BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            if(state is NotesLoading){
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 28),

                  itemCount: 3,
                  itemBuilder: (context, index) =>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: CustomShimmer(
                          height: 53,
                          width: size.width,
                          shape: BoxShape.rectangle,
                        ),
                      )
              );
            }
           else if(state is RefreshTokenFailure){
              return const TokenInvalidFail();
            }
            List<TodoModel> notes = BlocProvider.of<NotesCubit>(context).notesFiltered!;
  return    ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding:const EdgeInsets.symmetric(horizontal: 20),
        itemCount: notes.length,
        itemBuilder: (context, index) =>
            TaskItem(note: notes[index],)
    );}
    );
  }
}


