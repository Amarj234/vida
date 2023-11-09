import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/screen/teachers/widget/top_buttons.dart';
import 'package:vida/utils/constimage.dart';
import '../../utils/color.dart';
import '../../utils/style.dart';
import '../commonWidget/app_button.dart';
import '../enquiry/teacher_enquiry.dart';
import '../filter/filter_screen.dart';
import '../subscribe/subscribe_pay.dart';
import 'widget/contact_button.dart';

class TeacherList extends StatefulWidget {
  const TeacherList({Key? key}) : super(key: key);

  @override
  State<TeacherList> createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
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
                Row(
                  children: [
                    Flexible(
                      flex: 11,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFFF0DC)),
                        child: Row(
                          children: [
                            Image.asset(AssetImages.pointlocation),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                "198/1A ballygunge circuler road",
                                style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.textcolor),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(AssetImages.location),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 4,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const FilterScreen()));
                        },
                        child: Container(
                          //  width: 70,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), color: AppColor.radiocolr),
                          //  width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AssetImages.filter),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Filter",
                                style: GoogleFonts.roboto(
                                    fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TowButton(
                  balanceFun: () {},
                  subscribeFun: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const SubscribePay()));
                  },
                  subscribe: 'SUBSCRIBE NOW',
                  balance: '00',
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    for (int i = 0; i < 5; i++) ...[
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                            color: AppColor.radiocolr),
                        child: Row(
                          children: [
                            Image.asset(AssetImages.ankita),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
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
                                            text: "Experience:",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [
                                          TextSpan(
                                              text: " 5 Years",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Colors.white,
                                              ))
                                        ])),
                                    const SizedBox(
                                      width: 15,
                                    ),
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
                            )
                          ],
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
                            buildContainer("Qualification:", " BSc Honours", AssetImages.medal),
                            buildContainer("Location:", "  Ballygunge", AssetImages.location),
                            const SizedBox(
                              height: 5,
                            ),
                            i == 2
                                ? Container(
                                    width: double.infinity,
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                : const Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                                        child: ContactButton(),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  )
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
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              texcolor: const Color(0xff421200),
              hight: 76,
              txt: 'SUBMIT YOUR QUERY',
              col: AppColor.buttoncolor,
              myfun: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const TeacherEnquiry()));
              },
            ),
          ],
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
