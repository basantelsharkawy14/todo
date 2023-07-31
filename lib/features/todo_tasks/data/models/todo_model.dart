import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String status;
  @HiveField(1)
  String description;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  TodoModel({
    required this.status,
    required this.description,
    required this.date,
    required this.color,
  });
}