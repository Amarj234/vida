import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../commonWidget/app_button.dart';
import '../otplogin/login_screen.dart';
import 'widget/buttoncheckbox.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appbackground2,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 25, right: 25),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AssetImages.vida),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I Need A Teacher",
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff421200)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const ButtonCheckbox(
                    txt: 'At my place',
                    val: 1,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const ButtonCheckbox(
                    txt: 'At teacher’s place',
                    val: 2,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const ButtonCheckbox(
                    txt: 'In a coaching center',
                    val: 3,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const ButtonCheckbox(
                    txt: 'Online class',
                    val: 4,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              myfun: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              txt: 'CONTINUE',
              col: AppColor.main,
              hight: 50,
            ),
          ],
        ),
      ),
    );
  }
}
