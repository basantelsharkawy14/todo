import 'package:flutter/material.dart';

import '../../theme.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({Key? key,  this.stackTitle, required this.containerTitle, required this.function}) : super(key: key);
  final String ? stackTitle;
  final String containerTitle;
  final Function function;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return     GestureDetector(
      onTap:  ()  {
        function();
      },
      child: Stack(
        children: [
          Container(
            margin:  const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),

            child: Container(
              padding:const EdgeInsets.only(left: 18, right: 8, top: 18,bottom: 15),
              margin:const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  // boxShadow: <BoxShadow>[
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     spreadRadius: 4,
                  //     blurRadius: 18,
                  //     offset:const Offset(0, 2),),
                  // ],
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppTheme.primary.withOpacity(.1),width: 1.2),
                  color: AppTheme.background
                //AppTheme.white,
              ),
              child:  Row(
                children: [
                  SizedBox(
                    width: size.width * .04,
                  ),
                  SizedBox(
                    width: size.width *.75,
                    child: Text(
                     containerTitle,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height * .02),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(stackTitle != null)
          Align(
            alignment: Alignment.topRight,
            child: Container(
              color: AppTheme.primary,
              margin: const EdgeInsets.only(right: 35),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  stackTitle!,
                  style:
               const   TextStyle(color: Colors.white) ,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
