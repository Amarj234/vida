import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';

class NameFields extends StatelessWidget {
  const NameFields({Key? key, required this.image, required this.txt}) : super(key: key);
  final String image;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Image.asset(
                image,
                color: const Color(0xff707070),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                height: 25,
                width: 1,
                color: const Color(0xff707070),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  txt,
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.main),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 1,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffF5A925),
              Color(0xffED6237),
            ]),
          ),
        )
      ],
    );
  }
}
