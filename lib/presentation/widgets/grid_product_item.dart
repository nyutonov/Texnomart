import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:texnomart_demo/data/source/local/hive/hive_helper.dart';
import 'package:texnomart_demo/domain/app_repository.dart';

import '../../utils/my_utils.dart';
import '../pages/product_detail/product_detail_bloc.dart';
import '../pages/product_detail/product_detail_page.dart';

class GridProductItem extends StatefulWidget {
  int id;
  String image;
  String name;
  String monthlyPrice;
  int price;

  GridProductItem({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.monthlyPrice,
    required this.price,
    // this.callback
  });

  @override
  State<GridProductItem> createState() => _GridProductItemState();
}

class _GridProductItemState extends State<GridProductItem> {
  final appRepository = AppRepository();

  late bool isLike;

  // Callback<bool>? callback;

  @override
  void initState() {
    super.initState();

    isLike = appRepository.existProductInLikes(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => ProductDetailBloc(),
                  child: ProductDetailPage(id: widget.id),
                )
            )
        );
      },
      // borderRadius: BorderRadius.circular(12),
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.5),
      child: Ink(
        child: Container(
          width: 130,
          margin: const EdgeInsets.all(12),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: CachedNetworkImage(
                      imageUrl: widget.image,
                      placeholder: (context, s) => Center(
                          child: Lottie.asset(
                              'assets/lottie/loading.json'
                          )
                      ),
                      errorWidget: (context, s, o) => const Center(
                        child: Icon(
                            Icons.error
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.black26,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.black26,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.black26,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.black26,
                          size: 16,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.black26,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        color: Colors.black.withOpacity(0.06),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          child: Text(
                            widget.monthlyPrice,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 10
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${NumberFormat.currency(locale: 'uz').format(widget.price).substring(
                          0,
                          NumberFormat.currency(locale: 'uz').format(widget.price).length - 7)
                      } so\'m',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: FloatingActionButton(
                    onPressed: () async {
                      if (isLike) {
                        setState(() {
                          isLike = false;
                        });

                        await appRepository.deleteProductInLikes(widget.id);
                      } else {
                        setState(() {
                          isLike = true;
                        });

                        final productDetail = await appRepository.getProductDetail(widget.id);

                        await appRepository.addProductToLikes(productDetail!);
                      }
                    },
                    shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: Colors.black.withOpacity(0.1)), borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.white.withOpacity(0.5),
                    elevation: 0,
                    highlightElevation: 0,
                    splashColor: Theme.of(context).primaryColor,
                    child: (isLike)
                      ? const Icon(Icons.favorite_outlined, size: 20, color: Colors.red)
                      : const Icon(Icons.favorite_outline, size: 20)
                  )
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}