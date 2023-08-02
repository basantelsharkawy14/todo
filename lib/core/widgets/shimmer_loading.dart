import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key,required this.height,required this.width,required this.shape}) : super(key: key);
  final double height;
  final double width;
  final BoxShape shape;
  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style:  SkeletonAvatarStyle(
        width: width,
        height: height,
        shape: shape,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
