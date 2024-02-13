import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texnomart_demo/presentation/pages/profile/likes/likes_page.dart';
import 'package:texnomart_demo/presentation/pages/profile/our_stores/our_stores_page.dart';
import 'package:texnomart_demo/presentation/widgets/app_bar.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../likes/likes_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile', isShowBack: false),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          BlocProvider(
                            create: (context) => LikesBloc(),
                            child: const LikesPage(),
                          ))
                  );
                },
                child: const Text(
                    'Sevimlilar'
                )
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OurStoresPage())
                  );
                },
                child: const Text(
                    'Bizning do\'konlarimiz'
                )
            )
          ],
        ),
      ),
    );
  }
}
