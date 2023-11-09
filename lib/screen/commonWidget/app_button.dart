import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.txt,
      required this.myfun,
      required this.col,
      required this.hight,
      this.texcolor = Colors.white})
      : super(key: key);
  final String txt;
  final Color col;
  final Color? texcolor;
  final double hight;
  final Function() myfun;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myfun,
      child: Container(
        width: MediaQuery.of(context).size.width - hight,
        decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                txt,
                style:
                    GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400, color: texcolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
