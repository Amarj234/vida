import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';

class TowButton extends StatelessWidget {
  const TowButton({
    super.key,
    required this.balance,
    required this.subscribe,
    required this.subscribeFun,
    required this.balanceFun,
  });
  final String balance;
  final String subscribe;
  final Function() subscribeFun;
  final Function() balanceFun;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: balanceFun,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            decoration: BoxDecoration(
              border: const GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffF5A925),
                      Color(0xffED6237),
                    ]),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
              //color: Color(0xffFFF0DC)
            ),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Your Balance: ",
                    style: GoogleFonts.roboto(
                      color: const Color(0xffA3A3A3),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: balance,
                        style: GoogleFonts.roboto(
                          color: const Color(0xffA3A3A3),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ])),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: subscribeFun,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            decoration: BoxDecoration(
              border: const GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffF5A925),
                      Color(0xffED6237),
                    ]),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(50),
              //color: Color(0xffFFF0DC)
            ),
            child: Text(
              subscribe,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w400, color: Color(0xff421200)),
            ),
          ),
        ),
      ],
    );
  }
}
