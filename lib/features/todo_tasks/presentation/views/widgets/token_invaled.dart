import 'package:flutter/material.dart';
import 'package:todo/core/utils/styles.dart';
import 'package:todo/core/widgets/default_button.dart';
import 'package:todo/features/login/presentation/views/login_view.dart';
import 'package:todo/theme.dart';

class TokenInvalidFail extends StatelessWidget {
  const TokenInvalidFail({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height:90 ,),

        const Text("Your session is expired ",
            style: Styles.textStyle18),
        const SizedBox(height:10 ,),
         Text("Please, Login again to get your notes",
            style: Styles.textStyle16),
        const SizedBox(height:30 ,),

        DefaultButton(
          function: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
          },
          height: 50,
          width: size.width * .8 ,
          font: size.height * 0.022,
          radius: 35,
          textColor: AppTheme.white,
          title: 'Login',
        ),
      ],
    );
  }
}