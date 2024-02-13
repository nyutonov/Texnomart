import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class SliderItem extends StatelessWidget {
  String image;

  SliderItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            placeholder: (context, s) => Center(
                child: Lottie.asset(
                  'assets/lottie/loading.json',
                )
            ),
            errorWidget: (context, s, o) => const Center(
              child: Icon(
                Icons.error
              ),
            ),
          ),
        )
      ),
    );
  }
}