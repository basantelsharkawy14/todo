import 'package:flutter/material.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/theme.dart';

class CustomEmptyList extends StatelessWidget {
  const CustomEmptyList({
  super.key,
  required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: 75,),

        Image.asset("assets/images/page.png",height: size.height * .2,color: AppTheme.secondry,),
        SizedBox(height: 24,),
        Text(
            title,
            style:Styles.textStyle24),

      ],
    );
  }
}