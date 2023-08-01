import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String status;
  @HiveField(1)
  String description;
  @HiveField(2)
   String date;
  @HiveField(3)
  int color;
  @HiveField(4)
   String time;

  TodoModel({
    required this.status,
    required this.description,
    required this.date,
    required this.color,
    required this.time
  });
}