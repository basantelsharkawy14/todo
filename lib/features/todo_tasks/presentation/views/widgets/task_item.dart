import 'package:flutter/material.dart';
import 'package:todo/core/utils/styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: 53,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: size.width * .56,
            child: const Text('Shopping list, food for the week',
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14),
          ),

          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('26 Jun',
              style: Styles.textStyle12),
              Text('19:15',
                  style: Styles.textStyle10),
            ],
          )
        ],
      ),
    );
  }
}
