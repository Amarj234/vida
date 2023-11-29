import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vida/screen/commonWidget/app_button.dart';
import 'package:vida/screen/otplogin/provider/login_provider.dart';

import '../../utils/color.dart';
import '../../utils/constimage.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key, required this.mobile, required this.otp, required this.uid});

  final String mobile;
  final String otp;
  final int uid;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  LoginProvider? loginProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginProvider = Provider.of<LoginProvider>(context, listen: false);
      if (widget.otp.isNotEmpty) {
        loginProvider!.otpController.text = widget.otp;
      }
    });
  }

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
      textStyle: GoogleFonts.roboto(
          color: AppColor.main, fontWeight: FontWeight.w600, fontSize: 22),
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
      body: Consumer<LoginProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
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
                                  "Enter the OTP sent to - +91 ${widget.mobile}",
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
                                controller: loginProvider?.otpController,
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
                                      provider.resendCode(
                                          context, widget.mobile);
                                    },
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Resend OTP",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
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
                                              style: const TextStyle(
                                                  color: Colors.white),
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
                                loginProvider!.verifyCode(
                                    loginProvider!.otpController.text,
                                    widget.mobile,
                                    widget.uid,
                                    context);
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
