import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/functions/pick_date.dart';
import 'package:todo/core/functions/pick_time.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/core/widgets/default_button.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/features/todo_tasks/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/custom_templet.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/default_text_field.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/edit_note_color_list.dart';
import 'package:todo/theme.dart';

class EditNoteBody extends StatefulWidget {
  final TodoModel note;
  const EditNoteBody({
  super.key, required this.note,
  });

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {

  TextEditingController descriptionController = TextEditingController();
  String? dateSelected;
  String ? selectedTime ;

  setTime ({required TimeOfDay pickedTime}){
    if (pickedTime.toString() != selectedTime.toString()) {
      DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, pickedTime.hour, pickedTime.minute);
      selectedTime=  DateFormat("hh:mm a").format(dateTime).toString().toString();
    }
    setState(() {
    });
  }
  setDate ({required DateTime pickedDate}){
    if (pickedDate.toString() != dateSelected.toString()) {
      dateSelected =  DateFormat('dd-MMMM-yyyy').format(pickedDate).toString();
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('NEW TASK', style: Styles.textStyle20),
            const SizedBox(height:30 ,),

            Text('Color', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
            EditNoteColorsList(note: widget.note),
            const SizedBox(height:30 ,),

            Text('Description', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
            const SizedBox(height:10 ,),

            TodoTextField(
                controller: descriptionController,
                description: true,
                label: widget.note.description ??"enter your note",
                icon: Icons.security),
            const SizedBox(height:30 ,),

            Text('Date', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
            CustomItem(
                containerTitle:  dateSelected ?? widget.note.date,
                function: () async {
                  final DateTime? picked = await pickDate(context);
                  setDate(pickedDate: picked!);
                }),
            const SizedBox(height:30 ,),

            Text('Time', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),

            CustomItem(
                containerTitle:
               selectedTime ?? widget.note.time,
                function: () async {
                  TimeOfDay? pickedTime = await pickTime(context);
                  if (context.mounted) {
                    setTime(pickedTime: pickedTime!);
                  }
                }),
            // BlocBuilder<AddNoteCubit, AddNoteState>(
            //     builder: (context, state) =>
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultButton(
                              function: () {
                                widget.note.delete();

                                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                                Navigator.pop(context);

                              },
                              height: 60,
                              width: size.width * .32,
                              color: Colors.red,
                              font: size.height * 0.022,
                              radius: 35,
                              textColor: AppTheme.white,
                              title: 'Delete',
                            ),
                            DefaultButton(
                              function: () {
                                widget.note.description = descriptionController.text ==""? widget.note.description:descriptionController.text;
                                widget.note.date = dateSelected ?? widget.note.date;
                                widget.note.time = selectedTime ?? widget.note.time;
                                widget.note.save();
                                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                                Navigator.pop(context);
                              },
                              height: 60,
                              width: size.width * .32,
                              font: size.height * 0.022,
                              radius: 35,
                              textColor: AppTheme.white,
                              title: 'Update',
                            ),
                          ],
                        ),
                      ),
                    ),
            //),
            const SizedBox(height:20 ,),

          ],
        ),
      ),
    );
  }
}

