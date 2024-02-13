import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String name;

  CustomText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
        name,
        style: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black
      )
    );
  }
}