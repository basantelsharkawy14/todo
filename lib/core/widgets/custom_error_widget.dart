
import 'package:flutter/material.dart';
import 'package:todo/core/utils/styles.dart';

import '../../theme.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
const SizedBox(height: 80,),
          Image.asset(
            "assets/images/error.png",
            height:170,
            color: AppTheme.secondry,
          ),
          const SizedBox(height: 30,),
          Text(
            errMessage,
            style: Styles.textStyle18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}