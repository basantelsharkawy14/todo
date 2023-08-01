import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo_tasks/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/manager/notes_cubit/notes_cubit.dart';

import '../../../../../constants.dart';

class FilterColorsList extends StatefulWidget {
  const FilterColorsList({
  super.key,
  });

  @override
  State<FilterColorsList> createState() => _FilterColorsListState();
}

class _FilterColorsListState extends State<FilterColorsList> {
  int? currentIndex ;
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
                BlocProvider.of<NotesCubit>(context).colorFilter(kColors[index].value);
                Navigator.pop(context);
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