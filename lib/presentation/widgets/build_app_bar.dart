import 'package:flutter/material.dart';
import 'package:snagging/presentation/resources/image_assets.dart';

class BuildAppBar extends StatelessWidget with PreferredSizeWidget {
  BuildAppBar({Key? key,required this.title,}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image(image: AssetImage(ImageAssets.splashLogo),),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
