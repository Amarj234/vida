import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';

Chip myChip(String txt, bool isselect) {
  return Chip(
    side: BorderSide.none,
    labelStyle: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: txt == "Done"
            ? Colors.white
            : isselect
                ? Colors.white
                : AppColor.main),
    backgroundColor: Colors.white,
    label: Container(
        margin: EdgeInsets.only(left: txt == "Done" ? 40 : 0),
        decoration: BoxDecoration(
            color: txt == "Done"
                ? const Color(0xffF39C28)
                : isselect
                    ? AppColor.radiocolr
                    : Colors.white,
            borderRadius: txt == "Done"
                ? BorderRadius.circular(10)
                : BorderRadius.circular(50),
            border: Border.all(color: const Color(0xffA3A3A3))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Text(txt),
        )),
  );
}

// ignore: non_constant_identifier_names
Widget Heading(String txt) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.main),
        ),
      ],
    ),
  );
}

Widget gBorder() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    height: 1,
    width: double.infinity,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color(0xffF5A925),
          Color(0xffED6237),
        ])),
  );
}
