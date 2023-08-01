import 'package:flutter/material.dart';
import 'package:todo/features/todo_tasks/presentation/views/widgets/filter_sheet_body.dart';
import 'package:todo/theme.dart';

class FilterSideSheet extends StatelessWidget {
  const FilterSideSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppTheme.white,
              AppTheme.kBabyBlue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),
      child:  const FilterSheetBody(),
    );
  }
}
