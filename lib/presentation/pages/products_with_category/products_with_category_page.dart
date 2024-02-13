import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:texnomart_demo/presentation/pages/products_with_category/products_with_category_bloc.dart';
import 'package:texnomart_demo/presentation/widgets/app_bar.dart';
import 'package:texnomart_demo/presentation/widgets/grid_product_item.dart';
import 'package:texnomart_demo/presentation/widgets/list_product_item.dart';

import '../../../utils/status.dart';

class ProductWithCategoryPage extends StatefulWidget {
  String title;
  String category;

  ProductWithCategoryPage({super.key, required this.title, required this.category});

  @override
  State<ProductWithCategoryPage> createState() =>
      _ProductWithCategoryPageState();
}

class _ProductWithCategoryPageState extends State<ProductWithCategoryPage> {
  final bloc = ProductsWithCategoryBloc();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    bloc.add(InitProducts(widget.category));
    _scrollController.addListener(() => _scrollListener());
  }

  @override
  void dispose() {
    super.dispose();

    bloc.close();
  }

  _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      if (bloc.state.statusBottom != Status.LOADING) {
        bloc.add(AddPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: CustomAppBar(title: widget.title, isShowBack: true),
        body: SafeArea(
            child: BlocBuilder<ProductsWithCategoryBloc, ProductsWithCategoryState>(
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: state.status == Status.LOADING,
                  child: Stack(
                    children: [
                      if (state.status == Status.SUCCESS) Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      highlightColor: Theme
                                          .of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      child: Ink(
                                        height: double.infinity,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.compare_arrows,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              'Ommabopligi',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      highlightColor: Theme
                                          .of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      child: Ink(
                                        height: double.infinity,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.vertical_align_top,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              'Filtr',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        BlocProvider.of<ProductsWithCategoryBloc>(context).add(ChangeProductsShowing());
                                      },
                                      icon: Icon((state.isGrid == true) ? Icons.grid_view : Icons.list_outlined)
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.chips?.data?.categories?.length,
                                  itemBuilder: (context, index) =>
                                      Row(
                                        children: [
                                          if (index == 0)
                                            const SizedBox(width: 6),
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Container(
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(30)),
                                                color: Colors.black.withOpacity(
                                                    0.06),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 12, vertical: 6),
                                                child: Text(
                                                  state.chips?.data?.categories?[index].name ?? '',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 12
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (index == 19)
                                            const SizedBox(width: 6)
                                        ],
                                      )
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                controller: _scrollController,
                                itemCount: (state.products?.data?.products?.length ?? 0) ~/ 2,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    (state.isGrid == true)
                                        ? Row(
                                            children: [
                                              if (index % 2 == 0) Expanded(
                                                  child: GridProductItem(
                                                      id: state.products?.data?.products?[index].id ?? -1,
                                                      image: state.products?.data?.products?[index].image ?? '',
                                                      name: state.products?.data?.products?[index].name ?? '',
                                                      monthlyPrice: state.products?.data?.products?[index].axiomMonthlyPrice ?? '',
                                                      price: state.products?.data?.products?[index].salePrice ?? 0
                                                  )
                                              ),
                                              if (index % 2 == 0) Container(
                                                height: 230,
                                                width: 1,
                                                color: Colors.black.withOpacity(0.1),
                                              ),
                                              if (index % 2 == 0) Expanded(
                                                  child: GridProductItem(
                                                      id: state.products?.data?.products?[index + 1].id ?? -1,
                                                      image: state.products?.data?.products?[index + 1].image ?? '',
                                                      name: state.products?.data?.products?[index + 1].name ?? '',
                                                      monthlyPrice: state.products?.data?.products?[index + 1].axiomMonthlyPrice ?? '',
                                                      price: state.products?.data?.products?[index + 1].salePrice ?? 0
                                                  )
                                              )
                                            ],
                                          )
                                        : ListProductItem(
                                              id: state.products?.data?.products?[index].id ?? -1,
                                              image: state.products?.data?.products?[index].image ?? '',
                                              name: state.products?.data?.products?[index].name ?? '',
                                              monthlyPrice: state.products?.data?.products?[index].axiomMonthlyPrice ?? '',
                                              price: state.products?.data?.products?[index].salePrice ?? 0,
                                              oldPrice: 0,
                                          ),
                                    if ((state.isGrid == true && index % 2 == 0) || (state.isGrid == false)) Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    )
                                  ],
                                )
                            ),
                          )
                        ],
                      ),
                      if (state.status == Status.LOADING) Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Lottie.asset(
                            'assets/lottie/loading.json'
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
                      ),
                      if (state.statusBottom == Status.LOADING) Align(
                          alignment: Alignment.bottomCenter,
                          child: LinearProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          )
                      )
                    ],
                  ),
                );
              },
            )
        ),
      ),
    );
  }
}