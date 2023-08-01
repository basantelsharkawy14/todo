import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/functions/pick_date.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/core/widgets/default_button.dart';
import 'package:todo/features/todo_tasks/presentation/manager/notes_cubit/notes_cubit.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/custom_templet.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/filter_color_list.dart';
import 'package:todo/theme.dart';

class FilterSheetBody extends StatefulWidget {
  const FilterSheetBody({Key? key}) : super(key: key);

  @override
  _FilterSheetBodyState createState() => _FilterSheetBodyState();
}

class _FilterSheetBodyState extends State<FilterSheetBody> {
  String? dateSelected;

  setDate ({required DateTime pickedDate}){
    if (pickedDate.toString() != dateSelected.toString()) {
      dateSelected =  DateFormat('dd-MMMM-yyyy').format(pickedDate).toString();
      BlocProvider.of<NotesCubit>(context).dateFilter(dateSelected!);
      Navigator.pop(context);
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Filter', style: Styles.textStyle20),
            const SizedBox(height:50 ,),
            GestureDetector(
              onTap: (){
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              },
                child: Text('All Notes', style: Styles.textStyle16.copyWith(color: AppTheme.kLightBlack,decoration: TextDecoration.underline),)),
            const SizedBox(height:50 ,),

            Text('Color', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
            const FilterColorsList(),
            const SizedBox(height:60 ,),
            Text('Date', style: Styles.textStyle14.copyWith(color: AppTheme.kLightBlack)),
            CustomItem(
                containerTitle:  dateSelected ??"Pick date",
                function: () async {
                  final DateTime? picked = await pickDate(context);
                  setDate(pickedDate: picked!);
                }),
            const SizedBox(height:30 ,),


          ],
        ),
      ),
    );
  }
}
