import 'package:flutter/material.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';

import '../../../../../constants.dart';

class EditNoteColorsList extends StatefulWidget {
  final TodoModel note;
  const EditNoteColorsList({
  super.key, required this.note,
  });

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) =>
            GestureDetector(
              onTap: (){
                currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {

                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: currentIndex == index ?
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.grey.shade400,
                  child:  CircleAvatar(
                      radius: 15,
                      backgroundColor: kColors[index]
                  ),
                ):
                CircleAvatar(
                  radius: 17,
                  backgroundColor:kColors[index],
                ),
              ),
            ),
      ),
    );
  }
}