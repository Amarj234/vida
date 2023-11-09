import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/utils/color.dart';

class VisibleButton extends StatelessWidget {
  const VisibleButton({Key? key, required this.txt}) : super(key: key);
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColor.main)),
      child: Row(
        children: [
          const Icon(
            Icons.visibility,
            color: Color(0xffA3A3A3),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            txt,
            style:
                GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.main),
          ),
        ],
      ),
    );
  }
}
