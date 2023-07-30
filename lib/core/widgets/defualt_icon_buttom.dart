import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
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
  final IconData icon;

  const DefaultIconButton(
      {Key? key,
        required this.font,
        this.title,
        this.function,
        this.color,
       required this.icon,
        this.textColor = Colors.white,
        this.height,
        this.width,
        this.borderColor,
        this.isLoad = false,
        required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height *.06,
      //height:  MediaQuery.of(context).size.height * 01,
      width:width?? MediaQuery.of(context).size.width *.8,
      child: TextButton.icon(
        onPressed: () {
           function!();
        },

        style: TextButton.styleFrom(
          foregroundColor: textColor, padding: EdgeInsets.zero,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side:  BorderSide(color: borderColor ?? Colors.transparent), //,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        icon: Icon(
         icon,
          size: 24.0,
        ),
        label:  isLoad!?
        const CircularProgressIndicator(color: Colors.white,strokeWidth: 2,):
        Text(
          title!,
          style: TextStyle(
            //   height:  MediaQuery.of(context).size.height*0.001,
            //  fontWeight: FontWeight.bold,
            fontSize: font,),
        ),


      ),
    );
  }
}