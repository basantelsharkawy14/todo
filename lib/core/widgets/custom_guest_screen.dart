import 'package:flutter/material.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/core/widgets/default_button.dart';
import 'package:todo/theme.dart';

class CustomGuestScreen extends StatelessWidget {
  const CustomGuestScreen({
  super.key,
  required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(height: 75,),

        Image.asset("assets/images/page.png",height: size.height * .16,color: AppTheme.secondry,),
        const SizedBox(height: 24,),
        Text(
            title,
            style:Styles.textStyle20),
        const SizedBox(height: 24,),

        DefaultButton(font:  size.height*0.02, radius: 18,title:  "تسجيل الدخول",textColor: AppTheme.white,height: size.height* .07,width: size.width * .8,color: AppTheme.primary,function: () {
       //   Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
        }
        ),
      ],
    );
  }
}