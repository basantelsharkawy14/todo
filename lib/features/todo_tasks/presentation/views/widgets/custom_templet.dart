import 'package:flutter/material.dart';
import 'package:todo/theme.dart';


class CustomItem extends StatelessWidget {
  const CustomItem({Key? key, required this.containerTitle, required this.function}) : super(key: key);
  final String containerTitle;
  final Function function;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return     GestureDetector(
      onTap:  ()  {
        function();
      },
      child: Container(
        padding:const EdgeInsets.only( top: 18,bottom: 15),
     //   margin:const EdgeInsets.only(bottom: 8),
        decoration:  BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.5, color: Colors.grey.shade400),
          ),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
             containerTitle,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * .02),
            ),

            Icon(Icons.arrow_drop_down_outlined)
          ],
        ),
      ),
    );
  }
}
