import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:texnomart_demo/presentation/widgets/app_bar.dart';
import 'package:texnomart_demo/presentation/widgets/list_product_item.dart';

import '../../../../utils/status.dart';
import 'likes_bloc.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({super.key});

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<LikesBloc>(context).add(Init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Sevimlilar', isShowBack: true),
        body: BlocBuilder<LikesBloc, LikesState>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state.status == Status.LOADING,
              child: Stack(
                  children: [
                    if (state.status == Status.SUCCESS) ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.likedProducts?.length,
                        itemBuilder: (context, index) =>
                            Column(
                              children: [
                                ListProductItem(
                                  id: state.likedProducts?[index]?.data.data.id ?? 0,
                                  name: state.likedProducts?[index]?.data.data.name ?? '',
                                  image: state.likedProducts?[index]?.data.data.smallImages[0] ?? '',
                                  monthlyPrice: state.likedProducts?[index]?.data.data.monthlyPrice ?? '',
                                  price: state.likedProducts?[index]?.data.data.salePrice ?? 0,
                                  oldPrice: 0,
                                ),
                                Padding(
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
              ),
            );
          },
        )
    );
  }
}