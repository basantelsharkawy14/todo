import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:todo/theme.dart';

void customSnackBar(context, String title,String dis) {
  MotionToast(
    icon:  Icons.warning,
    primaryColor:  AppTheme.primary,
    secondaryColor:  AppTheme.secondry,
    backgroundType:  BackgroundType.solid,
    title:  Text(title,style: const TextStyle(color: AppTheme.white),),
    description:  Text(dis,style: const TextStyle(color: AppTheme.white),),
    position:  MotionToastPosition.top,
    animationType:  AnimationType.fromRight,
    layoutOrientation:  ToastOrientation.rtl,
    height:  100,
    width:  300,
  ).show(context);
}