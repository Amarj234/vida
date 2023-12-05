import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/utils/color.dart';
import '../../commonfun/tab_provider.dart';
import '../../utils/constimage.dart';
import '../../utils/style.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/common_textfields.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.uid}) : super(key: key);
  final int uid;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final prot = Provider.of<HometabProvider>(context, listen: false);
    prot.changeUid(widget.uid);
  }

  final mobile = TextEditingController();
  final key = GlobalKey<FormState>();
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
            child: Consumer<LoginProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
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
                            "We will send you 4 digit verification code to your registered mobile number",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.textoreng),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 23),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 11, horizontal: 15),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColor.darkoreng),
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
                              Form(
                                key: key,
                                child: Expanded(
                                  child: CommonTextFields(
                                    isvalid: 2,
                                    mycon: mobile,
                                    hint: 'Enter Mobile',
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          AppButton(
                            myfun: () {
                              if (key.currentState!.validate()) {
                                provider.sendCode(context, mobile.text);
                              }
                            },
                            txt: 'SEND OTP',
                            col: AppColor.main,
                            hight: 36,
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(AssetImages.loginbackground),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   padding: const EdgeInsets.only(bottom: 28.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       RichText(
      //           textAlign: TextAlign.center,
      //           text: TextSpan(
      //               text: "New to Vida? ",
      //               style: GoogleFonts.roboto(
      //                 color: Colors.white,
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //               children: [
      //                 TextSpan(
      //                   text: "Signup",
      //                   style: GoogleFonts.roboto(
      //                     decoration: TextDecoration.underline,
      //                     color: Colors.white,
      //                     fontSize: 16,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //               ])),
      //     ],
      //   ),
      // ),
    );
  }
}
