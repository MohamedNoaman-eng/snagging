import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snagging/bloc/home/home_cubit.dart';
import 'package:snagging/data/models/service_item.dart';
import 'package:snagging/presentation/widgets/slider_widget.dart';

class BuildCarouselSlider extends StatelessWidget {
  List<ServiceItem> imageList;

BuildCarouselSlider(this.imageList,{super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 2.1,
        //enableInfiniteScroll: false,
        //pageSnapping: true,
        onPageChanged: (index, reason) {
          context.read<HomePageCubit>().onChanged(index);
        },
        viewportFraction: .8,
        enlargeCenterPage: true,
      ),
      items: imageList
          .map(
            (item) => BuildSliderWidget(title: item.title,description: item.description,imageUrl: item.imageUrl),
      )
          .toList(),
    );
  }
}
