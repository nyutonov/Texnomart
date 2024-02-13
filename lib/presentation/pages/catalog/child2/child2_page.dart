import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texnomart_demo/presentation/widgets/app_bar.dart';

import '../../../../data/model/all_category/all_category.dart';
import '../../../widgets/all_category_item.dart';
import '../../products_with_category/products_with_category_page.dart';

class Child2Page extends StatelessWidget {
  Child2? categories;

  Child2Page({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: categories?.name ?? '', isShowBack: true),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: categories?.childs?.length,
          itemBuilder: (context, index) =>
              AllCategoryItem(
                image: null,
                title: categories?.childs?[index].name ?? '',
                isHasChilds: false,
                callback: (value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductWithCategoryPage(
                              title: categories?.childs?[index].name ?? '',
                              category: categories?.childs?[index].slug ?? ''
                          )
                      )
                  );
                },
              )
      ),
    );
  }
}