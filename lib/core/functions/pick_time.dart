import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

Future<TimeOfDay?> pickTime (context)async {
  return   await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
      });
}