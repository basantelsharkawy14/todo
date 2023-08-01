import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo_tasks/presentation/manager/add_note_cubit/add_note_cubit.dart';

import '../../../../../constants.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({
  super.key,
  });

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int currentIndex = 0;
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
             BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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