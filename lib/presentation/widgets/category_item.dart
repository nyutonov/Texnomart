import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/my_utils.dart';

class CategoryItem extends StatelessWidget {
  String image;
  String title;
  String slug;

  Callback<Map<String, String>> callback;

  CategoryItem({super.key, required this.image, required this.title, required this.slug, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90,
          width: 90,
          child: Center(
            child: Card(
              surfaceTintColor: Colors.white,
              margin: const EdgeInsets.all(6),
              child: InkWell(
                onTap: () { callback(
                  {
                    'title': title,
                    'slug': slug
                  }
                ); },
                borderRadius: BorderRadius.circular(12),
                highlightColor: Theme.of(context).primaryColor.withOpacity(0.5),
                child: Ink(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.network(
                        image,
                        height: 100,
                        width: 100,
                        placeholderBuilder: (context) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Lottie.asset(
                              'assets/lottie/loading.json'
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              fontSize: 10,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ],
    );
  }
}