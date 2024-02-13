import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:texnomart_demo/di/locator.dart';
import 'package:texnomart_demo/presentation/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:texnomart_demo/presentation/pages/splash/splash_page.dart';

import 'data/source/local/hive/hive_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Color(0xFFFBC100),
  // ));

  await HiveHelper.init();

  // setup();

  runApp(const MyApp());
}

Alice alice = Alice();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: alice.getNavigatorKey(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            primaryColor: const Color(0xFFFBC100),
            cardColor: const Color(0xFFF3F3F3)
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/bottom_navigation': (context) => const BottomNavigationPage()
        }
    );
  }
}