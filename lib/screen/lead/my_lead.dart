import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/utils/constimage.dart';
import '../../utils/color.dart';
import '../../utils/style.dart';

class MyLead extends StatefulWidget {
  const MyLead({Key? key}) : super(key: key);

  @override
  State<MyLead> createState() => _MyLeadState();
}

class _MyLeadState extends State<MyLead> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: CommonAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    for (int i = 0; i < 5; i++) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                            color: AppColor.radiocolr),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Anika Gupta",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: "Location: ",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: [
                                        TextSpan(
                                            text: " Dhakuria",
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.white,
                                            ))
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "Board:",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: [
                                        TextSpan(
                                            text: " ICSE",
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.white,
                                            ))
                                      ])),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColor.textoreng2,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            buildContainer("Want to Teach:", " XI - XII", AssetImages.book),
                            buildContainer("Subject: Science", " Mathematics", AssetImages.pen),
                            buildContainer(
                                "Teacher Preference :", " Female", AssetImages.teacherhed),
                            buildContainer(
                                "Need A Teacher :", " At my place ", AssetImages.needteacher),
                            const SizedBox(
                              height: 5,
                            ),
                            // i == 2
                            //     ?
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              decoration: const BoxDecoration(
                                  color: AppColor.main,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Text(
                                "Contact Number: +91 8794563210",
                                style: style18w500w,
                              ),
                            )
                            // : const Column(
                            //     children: [
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(horizontal: 20.0),
                            //         child: ContactButton(),
                            //       ),
                            //       SizedBox(
                            //         height: 15,
                            //       ),
                            //     ],
                            //   )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer(String txt1, String txt2, String image) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 18, height: 18,
            //  color: Color(0xffD25C2E),
          ),
          const SizedBox(
            width: 10,
          ),
          RichText(
              text: TextSpan(
                  text: txt1,
                  style: GoogleFonts.roboto(
                    color: const Color(0xff421200),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                TextSpan(
                    text: txt2,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff421200),
                    ))
              ])),
        ],
      ),
    );
  }
}
