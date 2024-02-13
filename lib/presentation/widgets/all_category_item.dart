import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/my_utils.dart';

class AllCategoryItem extends StatelessWidget {
  String? image;
  String title;
  bool isHasChilds;

  Callback<bool> callback;

  AllCategoryItem({
    super.key,
    this.image,
    required this.title,
    required this.isHasChilds,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { callback(true); },
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.5),
      child: Ink(
        width: double.infinity,
        height: 56,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 6),
          child: Row(
            children: [
              if (image != null) Row(
                children: [
                  SvgPicture.network(
                    image!,
                    height: 32,
                    width: 32,
                    placeholderBuilder: (context) => Center(
                        child: Lottie.asset('assets/lottie/loading.json')
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              Text(
                (title.length > 37) ? '${title.substring(0, 37)}...' : title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              const Spacer(),
              if (isHasChilds) const Icon(
                Icons.chevron_right,
                color: Colors.black26,
              )
            ],
          ),
        ),
      ),
    );
  }
}
