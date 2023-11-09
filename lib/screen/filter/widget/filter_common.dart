import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';

Chip mychip(String txt, bool isselect) {
  return Chip(
    labelStyle: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w400, color: isselect ? Colors.white : AppColor.main),
    backgroundColor: Colors.white,
    label: Container(
        decoration: BoxDecoration(
            color: isselect ? AppColor.radiocolr : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: const Color(0xffA3A3A3))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          style:
              GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.main),
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
        gradient: LinearGradient(colors: [
      Color(0xffF5A925),
      Color(0xffED6237),
    ])),
  );
}
