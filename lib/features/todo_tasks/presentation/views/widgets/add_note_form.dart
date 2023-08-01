import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/functions/pick_date.dart';
import 'package:todo/core/functions/pick_time.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/core/widgets/default_button.dart';
import 'package:todo/features/todo_tasks/data/models/todo_model.dart';
import 'package:todo/features/todo_tasks/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/colors_list.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/custom_templet.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/default_text_field.dart';
import 'package:todo/theme.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
  super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
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
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('NEW TASK', style: Styles.textStyle20),
              const SizedBox(height:30 ,),

              Text('Color', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
             const ColorsList(),
              const SizedBox(height:30 ,),

              Text('Description', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
              const SizedBox(height:10 ,),

              TodoTextField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field Required';
                    }
                    return null;
                  },
                  description: true,
                  label: 'Enter your note',
                  icon: Icons.security),
              const SizedBox(height:30 ,),

              Text('Date', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
              CustomItem(
                  containerTitle: dateSelected == null ?"Date":
                       dateSelected.toString(),
                  function: () async {
                    final DateTime? picked = await pickDate(context);
                    setDate(pickedDate: picked!);
                  }),
              const SizedBox(height:30 ,),

              Text('Time', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),

              CustomItem(
                  containerTitle:
                selectedTime == null ?"Time":
               selectedTime.toString(),
                  function: () async {
                    TimeOfDay? pickedTime = await pickTime(context);
                    if (context.mounted) {
                      setTime(pickedTime: pickedTime!);
                    }
                  }),
    BlocBuilder<AddNoteCubit, AddNoteState>(
    builder: (context, state) =>
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: DefaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var noteModel = TodoModel(
                          description: descriptionController.text,
                            date: dateSelected.toString(),
                          time: selectedTime.toString(),
                          status: "",
                          color:   BlocProvider.of<AddNoteCubit>(context).color.value
                        );
                        BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    height: 60,
                    width: size.width * .5 ,
                    font: size.height * 0.022,
                    radius: 35,
                    isLoad: state is AddNoteLoading,
                    textColor: AppTheme.white,
                    title: 'Add',
                  ),
                ),
              )),
              const SizedBox(height:20 ,),

            ],
          ),
        ),
      ),
    );
  }
}

