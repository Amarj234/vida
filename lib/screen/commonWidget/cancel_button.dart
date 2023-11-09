import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
    required this.txt,
    required this.myfun,
    required this.hight,
  }) : super(key: key);
  final String txt;

  final double hight;
  final Function() myfun;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myfun,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - hight,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.main), borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    txt,
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w400, color: AppColor.main),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
