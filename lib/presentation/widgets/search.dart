import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: InkWell(
        onTap: () {
          showToast('Search', context: context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 50,
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Icon(
                  Icons.search_outlined,
                  color: Colors.black26,
                  size: 26,
                ),
                const SizedBox(
                  width: 12
                ),
                Text(
                  'Men sotib olmoqchiman',
                  style: GoogleFonts.roboto(
                    color: Colors.black26,
                    fontSize: 16
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.mic_none,
                  color: Colors.black26,
                  size: 26,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}