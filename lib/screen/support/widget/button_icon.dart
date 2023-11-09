import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color.dart';

class ButtonIcon extends StatelessWidget {
  const ButtonIcon(
      {Key? key, required this.myfun, required this.txt, required this.heigth, required this.image})
      : super(key: key);
  final Function() myfun;
  final String txt;
  final String image;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myfun,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - heigth,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffC9C9C9)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(image),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    txt,
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.main),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
