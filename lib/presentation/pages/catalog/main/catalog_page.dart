import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:texnomart_demo/presentation/widgets/all_category_item.dart';
import 'package:texnomart_demo/presentation/widgets/search.dart';

import '../../../../utils/status.dart';
import '../child1/child1_page.dart';
import 'catalog_bloc.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final bloc = CatalogBloc();

  @override
  void initState() {
    super.initState();

    bloc.add(Init());
  }

  @override
  void dispose() {
    super.dispose();

    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: bloc,
        child: SafeArea(
          child: Column(
            children: [
              const Search(),
              Expanded(
                child: BlocBuilder<CatalogBloc, CatalogState>(
                  builder: (context, state) {
                    return AbsorbPointer(
                      absorbing: state.status == Status.LOADING,
                      child: Stack(
                        children: [
                          if (state.status == Status.SUCCESS) ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.allCategories?.data?.data?.length,
                              itemBuilder: (context, index) =>
                                  AllCategoryItem(
                                      image: state.allCategories?.data?.data?[index].icon,
                                      title: state.allCategories?.data?.data?[index].name ?? '',
                                      isHasChilds: true,
                                      callback: (value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Child1Page(
                                                    categories: state.allCategories?.data?.data?[index]
                                                )
                                            )
                                        );
                                      },
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
