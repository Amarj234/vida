import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/utils/color.dart';

class TableBody extends StatelessWidget {
  const TableBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        bodyHed("18-10-23", false),
        bodyHed("₹350", false),
        bodyHed("Paid", true),
        bodyHed("Credit Card", false),
      ],
    );
  }

  Widget bodyHed(String txt, bool color) {
    return Text(
      txt,
      style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: color ? const Color(0xff54A700) : AppColor.main),
    );
  }
}
