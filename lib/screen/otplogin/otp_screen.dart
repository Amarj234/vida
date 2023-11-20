import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vida/screen/commonWidget/app_button.dart';
import 'package:vida/screen/otplogin/provider/login_provider.dart';

import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../personalDetails/personal_details.dart';
import '../personalDetails/teacher_personaldetails.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.mobile, required this.id, required this.uid});

  final String mobile;
  final String id;
  final int uid;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  final defaultPinTheme = PinTheme(
    textStyle: GoogleFonts.roboto(color: Colors.white),
    height: 70,
    width: 80,
    decoration: BoxDecoration(
        border: Border.all(color: AppColor.main),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)),
  );
  final followingPinTheme = PinTheme(
    textStyle: GoogleFonts.roboto(color: Colors.white),
    height: 70,
    width: 80,
    decoration: BoxDecoration(
        border: Border.all(color: AppColor.main),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)),
  );
  final activePinTheme = PinTheme(
    textStyle: GoogleFonts.roboto(color: Colors.white),
    height: 70,
    width: 80,
    decoration: BoxDecoration(
        border: Border.all(color: AppColor.main, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    final submittedPinTheme = PinTheme(
      textStyle:
          GoogleFonts.roboto(color: AppColor.main, fontWeight: FontWeight.w600, fontSize: 22),
      height: 70,
      width: 76,
      decoration: BoxDecoration(
        color: Colors.white, //AppColor.main.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      backgroundColor: AppColor.main,
      resizeToAvoidBottomInset: false,
      body:
          // if (authController.otp.isNotEmpty) {
          //   otpController.text = authController.otp.value;
          // }
          // if (authController.isLoading.value) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (authController.success.value) {
          //   return Center(
          //     child: SizedBox(
          //       height: size.height * 0.25,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Image.asset(
          //             "assets/images/thumbs-up.gif",
          //             height: size.height * 0.08,
          //           ),
          //           const SizedBox(
          //             height: 20,
          //           ),
          //           const Text(
          //             "Your Submission has been successfully registered",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(height: 1.5),
          //           ),
          //           SizedBox(
          //             height: size.height * 0.02,
          //           ),
          //           ElevatedButton(
          //             style: ElevatedButton.styleFrom(
          //                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.2)),
          //             onPressed: () {
          //               //   submissionController.reset();
          //               Navigator.of(context).pop();
          //             },
          //             child: const Text(
          //               'OK',
          //               style:
          //                   TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   );
          // } else {

          Consumer<LoginProvider>(
        builder: (context, provider, child) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetImages.otpbackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "OTP Verification",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter the OTP sent to - +91 9874561230",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: const Color(0xffA48390),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: RichText(
                      //     text: TextSpan(
                      //         text: "An OTP (One Time Password) hah been sent \nto ",
                      //         style: GoogleFonts.roboto(
                      //           color: AppColor.textcolor,
                      //           fontSize: 15,
                      //           height: 1.5,
                      //         ),
                      //         children: [
                      //           TextSpan(
                      //               text: "+91 ${widget.mobile}",
                      //               style: GoogleFonts.roboto(
                      //                 fontWeight: FontWeight.w600,
                      //               ))
                      //         ]),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 56,
                        child: Pinput(
                          followingPinTheme: followingPinTheme,
                          controller: otpController,
                          defaultPinTheme: defaultPinTheme,
                          // focusedPinTheme: activePinTheme,
                          submittedPinTheme: submittedPinTheme,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      provider.seconds == 0
                          ? InkWell(
                              onTap: () {
                                provider.resendCode("8317008979");
                              },
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Resend OTP",
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              children: [
                                const Text(
                                  "Request again in :",
                                  style: TextStyle(color: Colors.red),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                provider.seconds != 0
                                    ? Text(
                                        "00:${provider.seconds.toString()}",
                                        style: const TextStyle(color: Colors.white),
                                      )
                                    : Container(),
                              ],
                            ),

                      const SizedBox(height: 30),
                      AppButton(
                        texcolor: const Color(0xff421200),
                        hight: 76,
                        txt: 'LOGIN',
                        col: AppColor.buttoncolor,
                        myfun: () {
                          if (widget.uid == 1) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const PersonalDetaild()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TeacherPersonalDetaild()));
                          }
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
