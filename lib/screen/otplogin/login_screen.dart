import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/screen/otplogin/otp_screen.dart';
import 'package:vida/utils/color.dart';

import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/common_textfields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.oreng,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetImages.loginbackground),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Your Mobile Number",
                  style: style20w500w,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "We will send you 4 digit verification code to register mobile number",
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.textoreng),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 13.5, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.darkoreng),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Image.asset(AssetImages.india),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "+91",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.textcolor),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Image.asset(AssetImages.drop)
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: CommonTextFields(
                        isvalid: 2,
                        mycon: mobile,
                        hint: 'Enter Mobile',
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                AppButton(
                  myfun: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpScreen(
                                  mobile: '831700',
                                  id: '55',
                                )));
                  },
                  txt: 'SEND OTP',
                  col: AppColor.main,
                  hight: 36,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
