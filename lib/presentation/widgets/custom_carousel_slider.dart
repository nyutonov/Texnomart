import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:texnomart_demo/presentation/widgets/slider_item.dart';

import '../../data/model/slider/slider_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<SliderDatum> sliders;
  final int currentIndexIndicator;
  final void Function(int index, CarouselPageChangedReason reason) onChanged;

  const CustomCarouselSlider({
    super.key,
    required this.sliders,
    required this.currentIndexIndicator,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: sliders.length,
            itemBuilder: (context, index, _) => SliderItem(image: sliders[index].imageWeb),
            options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                aspectRatio: 16 / 9,
                animateToClosest: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                viewportFraction: 1,
                onPageChanged: onChanged
            ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: currentIndexIndicator,
          count: sliders.length,
          effect: const WormEffect(
              dotHeight: 7,
              dotWidth: 7,
              dotColor: Colors.black26,
              spacing: 10,
              activeDotColor: Colors.black87
          ),
        )
      ],
    );
  }
}
