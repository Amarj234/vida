import 'package:flutter/material.dart';
import 'package:flutter_location_search/flutter_location_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rich_readmore/rich_readmore.dart';
import 'package:vida/screen/student/provider/student_list_provider.dart';
import 'package:vida/screen/teachers/widget/top_buttons.dart';
import 'package:vida/utils/constimage.dart';
import '../../utils/color.dart';
import '../../utils/style.dart';
import '../filter/filter_screen.dart';
import '../subscribe/subscribe_pay.dart';
import '../teachers/widget/contact_button.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  StudentListProvider? studentpro;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      studentpro = Provider.of<StudentListProvider>(context, listen: false);
      //studentpro!.getAddress();
      studentpro!.getlist(context);
      studentpro!.getBalance(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: CommonAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Consumer<StudentListProvider>(
              builder: (context, provider, child) {
                return Column(
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
                                    "${provider.culocation}",
                                    style: GoogleFonts.roboto(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.textcolor),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    onTap: () async {
                                      print("LocationData");
                                      LocationData? locationData = await LocationSearch.show(
                                          context: context, lightAdress: false, mode: Mode.overlay);
                                      if (locationData != null) {
                                        provider.culocation = locationData.address;
                                        provider.longitude = locationData.longitude;
                                        provider.latitude = locationData.latitude;
                                        provider.getlist(context);
                                      }
                                    },
                                    child: Image.asset(AssetImages.location)),
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
                            onTap: () async {
                              final data = await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const FilterScreen()));
                              if (data == true) {
                                studentpro!.getlist(context);
                              }
                            },
                            child: Container(
                              //  width: 70,
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.radiocolr),
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10), color: const Color(0xffF3F3F3)),
                    //   child: RichText(
                    //       text: TextSpan(
                    //           text: "Note: ",
                    //           style: GoogleFonts.roboto(
                    //             color: AppColor.main,
                    //             fontSize: 13,
                    //             fontWeight: FontWeight.w600,
                    //           ),
                    //           children: [
                    //         TextSpan(
                    //             text:
                    //                 "Note: If you don't want to pay subscription please wait for some time and you will get a call automatically as per your requirement. If you don't get a student in 24 hours please post the requirement again so that new Parent can contact you.",
                    //             style: GoogleFonts.roboto(
                    //               fontWeight: FontWeight.w400,
                    //               fontSize: 13,
                    //               color: AppColor.main,
                    //             ))
                    //       ])),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    TowButton(
                      balanceFun: () {},
                      subscribeFun: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const SubscribePay()));
                      },
                      subscribe: 'SUBSCRIBE NOW',
                      balance: provider.yourBalance == null
                          ? "0.0"
                          : provider.yourBalance!.d.data.numberOfView.toString(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    provider.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : provider.studentlist == null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Image.asset(AssetImages.empty),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text("List not Found"),
                                  ],
                                ),
                              )
                            : provider.studentlist!.data.length == 0
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Image.asset(AssetImages.empty),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text("List not Found"),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: provider.studentlist!.data.length,
                                    itemBuilder: (context, index) {
                                      final data = provider.studentlist!.data[index];
                                      return Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 20),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(10),
                                                    topLeft: Radius.circular(10)),
                                                color: AppColor.radiocolr),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(data.parentName,
                                                      style: GoogleFonts.roboto(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      )),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              "Board: ${data.board}",
                                                              style: GoogleFonts.roboto(
                                                                color: Colors.white,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ]),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            // Text(
                                                            //   "Location: ",
                                                            //   style: GoogleFonts
                                                            //       .roboto(
                                                            //     color: Colors.white,
                                                            //     fontSize: 14,
                                                            //     fontWeight:
                                                            //         FontWeight.w500,
                                                            //   ),
                                                            // ),
                                                            SizedBox(
                                                              width: MediaQuery.of(context)
                                                                      .size
                                                                      .width -
                                                                  90,
                                                              child: Text(
                                                                "Location: ${data.parentLocation}",
                                                                style: GoogleFonts.roboto(
                                                                  color: Colors.white,
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
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
                                                    bottomRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10))),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                buildContainer(
                                                    "Class: ", data.datumClass, AssetImages.book),
                                                buildContainer(
                                                    "Subject: ", data.subject, AssetImages.pen),
                                                buildContainer(
                                                    "Teacher Preference: ",
                                                    data.teacherPrefarence == "M"
                                                        ? "Male"
                                                        : data.teacherPrefarence == "F"
                                                            ? "Female"
                                                            : "ANY",
                                                    AssetImages.teacherhed),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 10, horizontal: 20),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        AssetImages.eye,
                                                        width: 18,
                                                        height: 18,
                                                        color: Color(0xffD25C2E),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      // RichText(
                                                      //     text: TextSpan(
                                                      //         text: txt1,
                                                      //         style: GoogleFonts.roboto(
                                                      //           color: const Color(0xff421200),
                                                      //           fontSize: 14,
                                                      //           fontWeight: FontWeight.w500,
                                                      //         ),
                                                      //         children: [
                                                      //       TextSpan(
                                                      //           text: txt2,
                                                      //           style: GoogleFonts.roboto(
                                                      //             fontWeight: FontWeight.w400,
                                                      //             fontSize: 14,
                                                      //             color: const Color(0xff421200),
                                                      //           ))
                                                      //     ])),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              "${data.totalView} Of 4 Teachers Viewed This",
                                                              style: GoogleFonts.roboto(
                                                                color: const Color(0xff421200),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ]),
                                                    ],
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets.symmetric(
                                                //       horizontal: 18.0, vertical: 5),
                                                //   child: VisibleButton(
                                                //       txt:
                                                //           "${data.totalView} Teachers View Your Requirement"),
                                                // ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                provider.showContact.contains(data.id)
                                                    ? Container(
                                                        width: double.infinity,
                                                        padding: const EdgeInsets.symmetric(
                                                            horizontal: 20, vertical: 20),
                                                        decoration: const BoxDecoration(
                                                            color: AppColor.main,
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius.circular(10),
                                                                bottomRight: Radius.circular(10))),
                                                        child: Text(
                                                          "Contact Number: ${data.parentPhoneNumber}",
                                                          style: style18w500w,
                                                        ),
                                                      )
                                                    : Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(
                                                                horizontal: 20.0),
                                                            child: InkWell(
                                                                onTap: () {
                                                                  provider.addList(
                                                                      data.id, context);
                                                                },
                                                                child: const ContactButton()),
                                                          ),
                                                          const SizedBox(
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
                                        ],
                                      );
                                    }),

                    const SizedBox(
                      height: 30,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      // bottomSheet: Container(
      //   color: Colors.white,
      //   padding: const EdgeInsets.only(bottom: 8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       AppButton(
      //         texcolor: const Color(0xff421200),
      //         hight: 76,
      //         txt: 'SUBMIT YOUR QUERY',
      //         col: AppColor.buttoncolor,
      //         myfun: () {
      //           Navigator.push(
      //               context, MaterialPageRoute(builder: (context) => const TeacherEnquiry()));
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Container buildContainer(String txt1, String txt2, String image) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 18,
            height: 18,
            color: Color(0xffD25C2E),
          ),
          const SizedBox(
            width: 10,
          ),
          // RichText(
          //     text: TextSpan(
          //         text: txt1,
          //         style: GoogleFonts.roboto(
          //           color: const Color(0xff421200),
          //           fontSize: 14,
          //           fontWeight: FontWeight.w500,
          //         ),
          //         children: [
          //       TextSpan(
          //           text: txt2,
          //           style: GoogleFonts.roboto(
          //             fontWeight: FontWeight.w400,
          //             fontSize: 14,
          //             color: const Color(0xff421200),
          //           ))
          //     ])),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt1,
                  style: GoogleFonts.roboto(
                    color: const Color(0xff421200),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 240,
                  child: RichReadMoreText.fromString(
                    text: txt2,
                    textStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xff421200),
                    ),
                    settings: LengthModeSettings(
                      trimLength: 16,
                      trimCollapsedText: 'show',
                      trimExpandedText: 'hide',
                      onPressReadMore: () {
                        /// specific method to be called on press to show more
                      },
                      onPressReadLess: () {
                        /// specific method to be called on press to show less
                      },
                      lessStyle: const TextStyle(color: Colors.blue),
                      moreStyle: const TextStyle(color: Colors.blue),
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
