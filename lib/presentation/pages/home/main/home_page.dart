import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:texnomart_demo/data/model/brand/brand_model.dart';
import 'package:texnomart_demo/data/model/category/category_model.dart';
import 'package:texnomart_demo/presentation/pages/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:texnomart_demo/presentation/pages/products_with_category/products_with_category_page.dart';
import 'package:texnomart_demo/presentation/widgets/brand_item.dart';
import 'package:texnomart_demo/presentation/widgets/custom_carousel_slider.dart';
import 'package:texnomart_demo/presentation/widgets/search.dart';
import 'package:texnomart_demo/presentation/widgets/slider_item.dart';
import 'package:texnomart_demo/presentation/widgets/text.dart';

import '../../../../data/model/product/product_model.dart';
import '../../../../data/model/slider/slider_model.dart';
import '../../../../utils/status.dart';
import '../../../widgets/category_item.dart';
import '../../../widgets/grid_product_item.dart';
import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final RefreshController _refreshControllerForError = RefreshController(initialRefresh: false);

  final bloc = HomeBloc();

  @override
  void initState() {
    super.initState();

    bloc.add(Init(false));
  }

  @override
  void dispose() {
    super.dispose();

    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'texnomart',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Icon(
                    Icons.emergency,
                    size: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (context, state) {
                if (state.status != Status.LOADING) {
                  _refreshController.refreshCompleted();
                }

                return SmartRefresher(
                  controller: _refreshControllerForError,
                  enablePullDown: state.status == Status.ERROR,
                  onRefresh: () => bloc.add(Init(false)),
                  child: Stack(
                    children: [
                      if (state.isFirstOpen == false && state.status != Status.ERROR)
                        AbsorbPointer(
                          absorbing: state.status == Status.LOADING,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Ink(
                                    width: double.infinity,
                                    decoration: ShapeDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(16),
                                                bottomRight: Radius.circular(16)
                                            )
                                        )
                                    ),
                                    child: const Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Search()
                                    )
                                ),
                                Expanded(
                                  child: SmartRefresher(
                                    controller: _refreshController,
                                    onRefresh: () => bloc.add(Init(false)),
                                    child: ListView(
                                      physics: const BouncingScrollPhysics(),
                                      children: [
                                        BlocBuilder<HomeBloc, HomeState>(
                                          buildWhen: (previous, current) => ((previous.sliders) != (current.sliders)) || (previous.currentIndexIndicator != current.currentIndexIndicator),
                                          builder: (context, state) {
                                            return CustomCarouselSlider(
                                                sliders: state.sliders ?? [],
                                                currentIndexIndicator: state.currentIndexIndicator ?? 0,
                                                onChanged: (index, reason) => bloc.add(ChangeCurrentIndexIndicator(index))
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        BlocBuilder<HomeBloc, HomeState>(
                                          buildWhen: (previous, current) => (previous.brands) != (current.brands),
                                          builder: (context, state) {
                                            return SizedBox(
                                              height: 60,
                                              child: ListView.builder(
                                                  physics: const BouncingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: state.brands?.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Row(
                                                      children: [
                                                        if (index == 0) const SizedBox(width: 6),
                                                        BrandItem(image: state.brands?[index].image ?? ''),
                                                        if (index == (state.brands?.length ?? 0) - 1) const SizedBox(width: 6),
                                                      ],
                                                    );
                                                  }
                                              ),
                                            );
                                          },
                                        ),
                                        Column(
                                          children: [
                                            const SizedBox(height: 12),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                              child: Row(
                                                children: [
                                                  CustomText(name: 'Kategoriyalar'),
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: () => BlocProvider.of<BottomNavigationBloc>(context).add(ChangePage(1)),
                                                    highlightColor: Theme.of(context).primaryColor.withOpacity(0.5),
                                                    borderRadius: BorderRadius.circular(30),
                                                    child: Padding(padding: const EdgeInsets.all(4.0),
                                                      child: Ink(
                                                        child: const Row(
                                                          children: [
                                                            Text(
                                                              ' barchasi',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors.grey
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons.chevron_right,
                                                              color: Colors.grey,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        BlocBuilder<HomeBloc, HomeState>(
                                          buildWhen: (previous, current) => (previous.categories) != (current.categories),
                                          builder: (context, state) {
                                            return SizedBox(
                                              height: 120,
                                              child: ListView.builder(
                                                  physics: const BouncingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: state.categories?.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Row(
                                                      children: [
                                                        if (index == 0) const SizedBox(width: 6),
                                                        CategoryItem(
                                                          image: state.categories?[index].image ?? '',
                                                          title: state.categories?[index].title ?? '',
                                                          slug: state.categories?[index].slug ?? '',
                                                          callback: (value) {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => ProductWithCategoryPage(
                                                                        title: value['title'] ?? '',
                                                                        category: value['slug'] ?? ''
                                                                    )
                                                                )
                                                            );
                                                          },
                                                        ),
                                                        if (index == (state.categories?.length ?? 0) - 1) const SizedBox(width: 6)
                                                      ],
                                                    );
                                                  }
                                              ),
                                            );
                                          },
                                        ),
                                        if (state.newProducts?.isNotEmpty ?? false)
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                                child: Divider(color: Colors.black.withOpacity(0.1)),
                                              ),
                                              const SizedBox(height: 12),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                child: Row(
                                                  children: [
                                                    CustomText(name: 'Yangi tovarlar')
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        BlocBuilder<HomeBloc, HomeState>(
                                          buildWhen: (previous, current) => (previous.newProducts) != (current.newProducts),
                                          builder: (context, state) {
                                            return (state.newProducts?.isNotEmpty ?? false) ? SizedBox(
                                              height: 280,
                                              child: ListView.builder(
                                                  physics: const BouncingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: state.newProducts?.length,
                                                  itemBuilder: (BuildContext context, int index) => GridProductItem(
                                                      id: state.newProducts?[index].id ?? -1,
                                                      image: state.newProducts?[index].image ?? '',
                                                      name: state.newProducts?[index].name ?? '',
                                                      monthlyPrice: state.newProducts?[index].axiomMonthlyPrice ?? '',
                                                      price: state.newProducts?[index].salePrice ?? 0
                                                  )
                                              ),
                                            ) : const SizedBox();
                                          },
                                        ),
                                        if (state.hitProducts?.isNotEmpty ?? false)
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                                child: Divider(color: Colors.black.withOpacity(0.1)),
                                              ),
                                              const SizedBox(height: 12),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                child: Row(
                                                  children: [
                                                    CustomText(name: 'Xit tovarlar')
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        BlocBuilder<HomeBloc, HomeState>(
                                          buildWhen: (previous, current) => (previous.hitProducts) != (current.hitProducts),
                                          builder: (context, state) {
                                            return (state.hitProducts?.isNotEmpty ?? false) ? SizedBox(
                                              height: 280,
                                              child: ListView.builder(
                                                  physics: const BouncingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: state.hitProducts?.length,
                                                  itemBuilder: (BuildContext context, int index) => GridProductItem(
                                                      id: state.hitProducts?[index].id ?? -1,
                                                      image: state.hitProducts?[index].image ?? '',
                                                      name: state.hitProducts?[index].name ?? '',
                                                      monthlyPrice: state.hitProducts?[index].axiomMonthlyPrice ?? '',
                                                      price: state.hitProducts?[index].salePrice ?? 0
                                                  )
                                              ),
                                            ) : const SizedBox();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (state.status == Status.LOADING)
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Lottie.asset(
                              'assets/lottie/loading.json',
                            ),
                          ),
                        ),
                      if (state.status == Status.ERROR)
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Server error',
                            style: GoogleFonts.roboto(fontSize: 26),
                          ),
                        )
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
