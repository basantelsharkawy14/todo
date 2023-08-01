
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/constants.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = const Color(0xffFF008D);
  addNote(TodoModel note) async {
  //  note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<TodoModel>(kTodoBox);
      await notesBox.add(note);
      print(notesBox.get(kTodoBox));
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}