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
import 'package:todo/features/todo_tasks/presentation/views/widgets/todo_text_field.dart';
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
  DateTime? dateSelected;
  String ? selectedTime ;
  List<String> statusList =['Pending', 'Complete', 'Cancel'];
  String ?status ;
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
      dateSelected =  pickedDate;
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
            const SizedBox(height:20 ,),

            Text('Color', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
            EditNoteColorsList(note: widget.note),
            const SizedBox(height:20 ,),

            Text('Description', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
            const SizedBox(height:20 ,),

            TodoTextField(
                controller: descriptionController,
                description: true,
                label: widget.note.description ??"enter your note",
                icon: Icons.security),
            const SizedBox(height:20 ,),

            Text('Date', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
            CustomItem(
                containerTitle:
                dateSelected != null? DateFormat('dd-MMMM-yyyy').format(dateSelected!).toString():
                DateFormat('dd-MMMM-yyyy').format(DateTime.parse(widget.note.date)).toString(),
                function: () async {
                  final DateTime? picked = await pickDate(context);
                  setDate(pickedDate: picked!);
                }),
            const SizedBox(height:20 ,),

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
            const SizedBox(height:20 ,),

            Text('Status', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),

            SizedBox(
              //   width: size.width,
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
                items: statusList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value,style: Styles.textStyle12,),
                  );
                }).toList(),
                value: status ?? widget.note.status,
                onChanged: (newValue) {
                  setState(() {
                    status = newValue!;
                  });
                },
              ),
            ),

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
                                widget.note.date = dateSelected!= null ? dateSelected.toString() : widget.note.date;
                                widget.note.time = selectedTime ?? widget.note.time;
                                widget.note.status = status ?? widget.note.status;
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
            const SizedBox(height:20 ,),

          ],
        ),
      ),
    );
  }
}

