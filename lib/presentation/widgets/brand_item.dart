import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class BrandItem extends StatelessWidget {
  String image;

  BrandItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 90,
      child: Center(
        child: Card(
          surfaceTintColor: Colors.white,
          margin: const EdgeInsets.all(6),
          child: InkWell(
            onTap: () {},
            highlightColor: Theme.of(context).primaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: (image.endsWith('.svg'))
                      ? SvgPicture.network(
                          image,
                          height: 100,
                          width: 100,
                          placeholderBuilder: (context) => Center(
                              child: Lottie.asset('assets/lottie/loading.json')
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: image,
                          height: 100,
                          width: 100,
                          placeholder: (context, s) => Center(
                              child: Lottie.asset('assets/lottie/loading.json')
                          ),
                          errorWidget: (context, s, o) => const Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
