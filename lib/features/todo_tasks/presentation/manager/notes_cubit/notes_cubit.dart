import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:todo/constants.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/core/service/notification_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:todo/features/todo_tasks/data/repo/todo_repo.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final TodoRepo todoRepo;

  NotesCubit(this.todoRepo) : super(NotesInitial()){
    refreshToken();
  }

  List<TodoModel>? allNotes;
  List<TodoModel>? notesFiltered=[];

  fetchAllNotes() {
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

  statusFilter(String status){
    notesFiltered = [];
    if(allNotes != null){
      for (var element in allNotes!) {
        if(element.status == status){
          notesFiltered!.add(element);
        }
      }
    }
    emit(NotesSuccess());

  }

addNotification({required String date, required String title, required String body, required int id}) async{
  await NotificationService().scheduleNotification(
    id,
   title,
    body,
    tz.TZDateTime.parse(tz.local, date),
  );
}

fireNotification (){
  DateTime now =  DateTime.now();
  for (var element in allNotes!) {
    if(DateTime.parse(element.date) == DateTime(now.year, now.month, now.day)){
      addNotification(
        date: now.add(const Duration(seconds: 1)).toString(),
        title: "you have a note now",
        body: element.description,
        id: allNotes!.indexOf(element),
      );
    }
  }
}

  refreshToken() async  {
    emit(NotesLoading());
    var result = await todoRepo.refreshToken();
    result.fold((failure) {
      print(failure.errMessage);
      debugPrint(failure.errMessage);
      emit(RefreshTokenFailure(
        error: failure.errMessage,
      ));
    }, (user) async{
      debugPrint(user.toString());
      final key = Hive.generateSecureKey();
      final encryptedBox= await Hive.openBox('userBox', encryptionCipher: HiveAesCipher(key));
      encryptedBox.put('token', 'Bearer ${user.token}');
      print(encryptedBox.get('token'));
      await fetchAllNotes();
      fireNotification();
    });
  }


}