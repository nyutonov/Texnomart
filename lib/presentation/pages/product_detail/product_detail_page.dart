import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/model/product_detail/product_detail_model.dart';
import '../../../utils/status.dart';
import 'product_detail_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  int id;
  ProductDetailModel? product;

  ProductDetailPage({super.key, required this.id, this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ProductDetailBloc>(context).add(DetailInit(id: widget.id, product: widget.product));
  }

  var myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back, color: Colors.black,
                  size: 30,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ProductDetailBloc>(context).add(ClickLike(widget.id));
                  },
                  icon: (state.isLike == true)
                      ? const Icon(Icons.favorite_outlined, color: Colors.red)
                      : const Icon(Icons.favorite_border, color: Colors.black),
                )
              ],
              backgroundColor: Colors.amber,
            ),
            body: Stack(
                children: [
                  if (state.status == Status.SUCCESS) SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        CarouselSlider(
                          items: [
                            for (String i in state.details?.data.data
                                .smallImages ?? [])
                              Container(
                                height: 140,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 14),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(i),
                                      fit: BoxFit.contain
                                  ),
                                ),
                              )
                          ],
                          options: CarouselOptions(
                              clipBehavior: Clip.antiAlias,
                              height: 220,
                              autoPlay: false,
                              viewportFraction: 1,
                              //autoPlayInterval: const Duration(microseconds: 800),
                              autoPlayCurve: Curves.linear,
                              autoPlayAnimationDuration: const Duration(
                                  seconds: 1),
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              aspectRatio: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  myCurrentIndex = index;
                                });
                              }
                          ),
                        ),
                        const SizedBox(height: 40),
                        AnimatedSmoothIndicator(
                          activeIndex: myCurrentIndex,
                          count: state.details?.data.data.smallImages.length ??
                              0,
                          effect: const WormEffect(
                              dotHeight: 7,
                              dotWidth: 7,
                              dotColor: Colors.black12,
                              spacing: 4,
                              activeDotColor: Colors.black
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Mavjud',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.greenAccent
                                ),
                              ),
                              Text("Kod.${state.details?.data.data.code}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.details?.data.data.name ?? '',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${state.details?.data.data.salePrice
                                  .toString() ?? ''}  so'm",
                              style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: ShapeDecoration(
                                color: Colors.black12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Muddatli to'lov:",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87
                                      ),
                                    ),
                                    Text(
                                      state.details?.data.data.monthlyPrice ??
                                          '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 210,
                                child: Text(
                                    state.details?.data.data.mainCharacters[0]
                                        .name ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis
                                ),
                              ),
                              Text(
                                  "${state.details?.data.data.mainCharacters[0]
                                      .value}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ],
                          ),
                        ),
                        for(MainCharacterElement i in state.details?.data.data
                            .mainCharacters ?? [])
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 210,
                                  child: Text(
                                      i.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis
                                  ),
                                ),
                                Text(
                                    i.value,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  if (state.status == Status.LOADING) Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.asset(
                        'assets/lottie/loading.json',
                      ),
                    ),
                  ),
                  if (state.status == Status.ERROR) Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Server error',
                      style: GoogleFonts.roboto(
                          fontSize: 26
                      ),
                    ),
                  )
                ]
            )
        );
      },
    );
  }
}

