import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo/constants.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<TodoModel>? allNotes;
  List<TodoModel>? notesFiltered=[];

  fetchAllNotes() {
    print("llll");
    var notesBox = Hive.box<TodoModel>(kTodoBox);

    allNotes = notesBox.values.toList();
    notesFiltered = allNotes;
    emit(NotesSuccess());
  }

  colorFilter(int color){
    notesFiltered = [];
    if(allNotes != null){
    for (var element in allNotes!) {
      if(element.color == color){
        notesFiltered!.add(element);
      }
    }
      emit(NotesSuccess());
    }}

  dateFilter(String date){
    notesFiltered = [];
    if(allNotes != null){
      for (var element in allNotes!) {
        if(element.date == date){
          notesFiltered!.add(element);
        }
      }
    }
    emit(NotesSuccess());

  }

}