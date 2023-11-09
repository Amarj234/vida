import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/screen/home_screen.dart';
import 'package:vida/utils/color.dart';
import 'package:vida/utils/constimage.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appbarcolor,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2.678,
          width: MediaQuery.of(context).size.width - 50,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: const Color(0xffD25C2E)),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                AssetImages.paysuccess,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Payment Successful",
                style: GoogleFonts.roboto(
                    fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color(0xff421200), borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Back",
                          style: GoogleFonts.roboto(
                              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
