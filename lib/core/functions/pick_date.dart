import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

Future<DateTime?> pickDate (context)async{
  return   await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.kPrimary,
            colorScheme: const ColorScheme.light(
              primary: AppTheme.kPrimary,
            ),
            buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));
}