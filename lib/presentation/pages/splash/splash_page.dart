import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).whenComplete(() => Navigator.pushReplacementNamed(context, '/bottom_navigation'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'texnomart',
                    style: GoogleFonts.roboto(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.black
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 14.0),
                    child: Icon(
                      Icons.emergency,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Lottie.asset(
                      'assets/lottie/loading2.json',
                      height: 90,
                      width: 90
                    )
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

