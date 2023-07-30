import 'package:flutter/material.dart';

import '../../theme.dart';


class ScreenHeader extends StatelessWidget {
  const ScreenHeader({Key? key,required this.title,required this.imageIcon,  this.back = true}) : super(key: key);
final String imageIcon;
final String title;
final bool back;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  Row(
      children: [
        Image.asset(
          imageIcon,
          height: size.width * .07,
          color: AppTheme.secondry,
        ),
        SizedBox(
          width: size.width * .02,
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.nearlyBlack,
              height: size.height * .002,
              fontSize: size.width * .07),
        ),
        if(back)
        const Spacer(),
        if(back)
          InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child:const Icon(Icons.arrow_forward_ios,color: AppTheme.primary,))
        // Image.asset(
        //   "assets/images/left-arrow.png",
        //   height: size.width * .09,
        //   color: AppTheme.secondry,
        // ),

      ],
    );
  }
}
