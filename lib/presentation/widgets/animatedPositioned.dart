import 'package:flutter/material.dart';

class BuildAnimatedPositioned extends StatelessWidget {
  BuildAnimatedPositioned(this.alignment1,this.alignment2,this.animate,this.imageName, {super.key});
  bool animate;
  String imageName;
  Alignment alignment1;
  Alignment alignment2;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        top: animate ? alignment1.x : alignment1.y,
        left: animate ? alignment2.x : alignment2.y,
        duration: const Duration(milliseconds: 1600),
        child:  SizedBox(
          child: Image(
            image: AssetImage(imageName),
            fit: BoxFit.fill,
          ),
        ));
  }
}
