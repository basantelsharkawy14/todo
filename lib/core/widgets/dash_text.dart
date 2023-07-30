import 'package:flutter/material.dart';

Widget dashedText() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 0),
    child: const Text(
      '------------------------------------------',
      maxLines: 1,
      style:
      TextStyle(fontSize: 18.0, color: Colors.black12, letterSpacing: 5),
    ),
  );
}