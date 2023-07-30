import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:todo/theme.dart';

class LoadingScreen {
  LoadingScreen._();

  static show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,

            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  child:LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    colors:  [AppTheme.secondry,
                      AppTheme.secondry,
                    ],
                    strokeWidth: 3,
                    backgroundColor: Colors.transparent,
                    pathBackgroundColor: Colors.white  ,

                  ),
                ),
              ],
            ),

        );
      },
    );
  }
}