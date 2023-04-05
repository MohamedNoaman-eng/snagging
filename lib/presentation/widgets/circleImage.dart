import 'package:flutter/material.dart';
import 'package:snagging/presentation/widgets/text.dart';

import '../resources/colors_managers.dart';

class BuildCircleImage extends StatelessWidget {
  int id;
  String image;
  String title;
  double height;

  BuildCircleImage(this.id, this.image, this.title, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: height,
      child: LayoutBuilder(
        builder: (context, constraint) => Column(
          children: [
            SizedBox(
              height: constraint.maxHeight * 0.6,
              child: CircleAvatar(
                radius: constraint.maxHeight * 0.4,
                backgroundColor: ColorManager.primary.withOpacity(0.1),
                child: CircleAvatar(
                  backgroundColor: ColorManager.primary,
                  radius: constraint.maxHeight * 0.2,
                  child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image(
                        image: AssetImage(image),
                      )),
                ),
              ),
            ),
            SizedBox(
              //width: constraint.maxWidth *0.4,
              height: constraint.maxHeight * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "0$id",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.red),
                  ),
                  BuildFittedText(
                    text: title,
                    textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
