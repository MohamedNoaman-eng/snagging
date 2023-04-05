import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snagging/bloc/home/home_cubit.dart';
import 'package:snagging/data/models/service_item.dart';
import 'package:snagging/presentation/widgets/slider_widget.dart';

import '../../data/models/testimonials_item.dart';
import 'feedback_widget.dart';

class BuildFeedbackItem extends StatelessWidget {
  List<TestimonialsItem> imageList;

  BuildFeedbackItem(this.imageList, {super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        initialPage: 0,
        //aspectRatio: 2.1,
        reverse: false,
        //padEnds:false,
        // onPageChanged: (index, reason) {
        //   context.read<HomePageCubit>().onChanged(index);
        // },
        viewportFraction: .8,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
      ),
      items: imageList
          .map(
            (item) => BuildFeedbackWidget(item.imageUrl, item.name, item.position, item.content),
      )
          .toList(),
    );
  }
}
