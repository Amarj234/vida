import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rich_readmore/rich_readmore.dart';
import 'package:vida/screen/teachers/widget/top_buttons.dart';
import 'package:vida/utils/constimage.dart';
import '../../config/baseUrl.dart';
import '../../utils/color.dart';
import '../../utils/style.dart';
import '../commonWidget/app_button.dart';
import '../enquiry/teacher_enquiry.dart';
import '../filter/filter_screen.dart';
import '../splase/provider/appmessage_provider.dart';
import '../subscribe/subscribe_pay.dart';
import 'provider/teacherlist_provider.dart';
import 'widget/contact_button.dart';

class TeacherList extends StatefulWidget {
  const TeacherList({Key? key}) : super(key: key);

  @override
  State<TeacherList> createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TeacherListProvider? techerpro;
  AppmessageProvider? appmessageProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appmessageProvider =
        Provider.of<AppmessageProvider>(context, listen: false);
    appmessageProvider!.getlist(context);
    techerpro = Provider.of<TeacherListProvider>(context, listen: false);
    techerpro!.getAddress();
    techerpro!.getlist(context);
  }

  String toCapitalized(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: CommonAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Consumer<TeacherListProvider>(
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
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
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
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
                            onTap: () async {
                              final data = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FilterScreen()));
                              if (data == true) {
                                techerpro!.getlist(context);
                              }
                            },
                            child: Container(
                              //  width: 70,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffF3F3F3)),
                      child: Consumer<AppmessageProvider>(
                        builder: (context, provider, child) {
                          return provider.isLoading
                              ? Container()
                              : RichText(
                                  text: TextSpan(
                                      text: "Note: ",
                                      style: GoogleFonts.roboto(
                                        color: AppColor.main,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                      TextSpan(
                                          text: provider.appMessage ?? "",
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: AppColor.main,
                                          ))
                                    ]));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TowButton(
                      balanceFun: () {},
                      subscribeFun: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SubscribePay()));
                      },
                      subscribe: 'SUBSCRIBE NOW',
                      balance: '00',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<TeacherListProvider>(
                      builder: (context, provider, child) {
                        return provider.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : provider.teacherList == null
                                ? const Center(
                                    child: Text("List not Found"),
                                  )
                                : provider.teacherList!.data.isEmpty
                                    ? const Center(
                                        child: Text("List not Found"),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            provider.teacherList!.data.length,
                                        itemBuilder: (context, index) {
                                          final data =
                                              provider.teacherList!.data;
                                          return Column(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10)),
                                                    color: AppColor.radiocolr),
                                                child: Row(
                                                  children: [
                                                    // Image.asset(
                                                    //   AssetImages.ankita,
                                                    //   width: 85,
                                                    //   height: 91,
                                                    // ),
                                                    Container(
                                                      width: 85,
                                                      height: 91,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  "$baseImgUrl${data[index].userImage}"))),
                                                    ),

                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            data[index].name ??
                                                                "",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: (MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      2) -
                                                                  60,
                                                              child: RichText(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  text: TextSpan(
                                                                      text: "Experience: ",
                                                                      style: GoogleFonts.roboto(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                      children: [
                                                                        TextSpan(
                                                                            spellOut:
                                                                                true,
                                                                            text:
                                                                                "${data[index].extraParm4 ?? ""} Years",
                                                                            style:
                                                                                GoogleFonts.roboto(
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 14,
                                                                              color: Colors.white,
                                                                            ))
                                                                      ])),
                                                            ),
                                                            // SizedBox(
                                                            //   width: MediaQuery.of(
                                                            //               context)
                                                            //           .size
                                                            //           .width -
                                                            //       300,
                                                            //   child: RichText(
                                                            //       overflow:
                                                            //           TextOverflow
                                                            //               .ellipsis,
                                                            //       text: TextSpan(
                                                            //           text: "Board: ",
                                                            //           style: GoogleFonts.roboto(
                                                            //             color: Colors
                                                            //                 .white,
                                                            //             fontSize:
                                                            //                 14,
                                                            //             fontWeight:
                                                            //                 FontWeight.w500,
                                                            //           ),
                                                            //           children: [
                                                            //             TextSpan(
                                                            //                 spellOut:
                                                            //                     true,
                                                            //                 text: data[index].extraParm3 ??
                                                            //                     "",
                                                            //                 style:
                                                            //                     GoogleFonts.roboto(
                                                            //                   fontWeight: FontWeight.w400,
                                                            //                   fontSize: 14,
                                                            //                   color: Colors.white,
                                                            //                 ))
                                                            //           ])),
                                                            // ),
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
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(10),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    buildContainer(
                                                        "Want to Teach: ",
                                                        data[index]
                                                                .extraParm5 ??
                                                            "",
                                                        AssetImages.book),
                                                    buildContainer(
                                                        "Subject: Science ",
                                                        data[index]
                                                                .extraParm6 ??
                                                            "",
                                                        AssetImages.pen),
                                                    buildContainer(
                                                        "Qualification: ",
                                                        data[index]
                                                                .extraParm2 ??
                                                            "",
                                                        AssetImages.medal),
                                                    buildContainer(
                                                        "Location: ",
                                                        data[index].location ??
                                                            "",
                                                        AssetImages.location),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    provider.showContact
                                                            .contains(
                                                                data[index].id)
                                                        ? Container(
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                    vertical:
                                                                        20),
                                                            decoration: const BoxDecoration(
                                                                color: AppColor
                                                                    .main,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10))),
                                                            child: Text(
                                                              "Contact Number: ${data[index].phoneNo}",
                                                              style:
                                                                  style18w500w,
                                                            ),
                                                          )
                                                        : Column(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        20.0),
                                                                child: InkWell(
                                                                    onTap: () {
                                                                      provider.addList(
                                                                          data[index]
                                                                              .id);
                                                                    },
                                                                    child:
                                                                        const ContactButton()),
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
                                        });
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                );
              },
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
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TeacherEnquiry()));
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            //  color: Color(0xffD25C2E),
          ),
          const SizedBox(
            width: 10,
          ),
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
                  width: MediaQuery.of(context).size.width - 220,
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
