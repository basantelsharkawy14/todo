import 'package:flutter/material.dart';
import 'package:todo/theme.dart';

class DefaultButton extends StatelessWidget {
  final String? title;
  final Function? function;
  final Color ?color;
  final Color ?textColor;
  final double  radius;
  final double font;
  final double? width;
  final double ? height;
  final Color ? borderColor;
  final bool ? isLoad;

  const DefaultButton(
      {Key? key,
        required this.font,
        this.title,
        this.function,
        this.color,
        this.textColor,
        this.height,
        this.width,
        this.borderColor,
        this.isLoad = false,
        required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height ?? MediaQuery.of(context).size.height *.06,
      width:width?? MediaQuery.of(context).size.width *.8,
      decoration: BoxDecoration(
          gradient:  LinearGradient(
            colors: <Color>[
            color ??AppTheme.kDarkBlue,
            color??  AppTheme.kLightBlue,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(radius))
      ),
      child: TextButton(
        onPressed: () {
           function!();
        },
        style: TextButton.styleFrom(
          foregroundColor: textColor, padding: EdgeInsets.zero,
        ),
        child:
        isLoad!?
            const CircularProgressIndicator(color: Colors.white,strokeWidth: 2,):
        Text(
          title!,
          style: TextStyle(
            fontSize: font,),
        ),
      ),
    );
  }
}
