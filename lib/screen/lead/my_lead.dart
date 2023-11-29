import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rich_readmore/rich_readmore.dart';
import 'package:vida/screen/lead/provider/lead_provider.dart';
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

  LeadProvider? leadProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    leadProvider = Provider.of<LeadProvider>(context, listen: false);
    leadProvider!.getlist(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: CommonAppBar(context: context),
      body: Consumer<LeadProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : provider.leadlist == null
                  ? Center(
                      child: Text("List not Found"),
                    )
                  : SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: provider.leadlist!.data.length,
                                  itemBuilder: (context, index) {
                                    final data = provider.leadlist!.data[index];
                                    return Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  topLeft: Radius.circular(10)),
                                              color: AppColor.radiocolr),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(data.parentName ?? "",
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    )),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Location: ",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                232,
                                                            child:
                                                                RichReadMoreText
                                                                    .fromString(
                                                              text:
                                                                  data.parentLocation ??
                                                                      "",
                                                              textStyle:
                                                                  GoogleFonts
                                                                      .roboto(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              settings:
                                                                  LengthModeSettings(
                                                                trimLength: 15,
                                                                trimCollapsedText:
                                                                    'show',
                                                                trimExpandedText:
                                                                    'hide',
                                                                onPressReadMore:
                                                                    () {
                                                                  /// specific method to be called on press to show more
                                                                },
                                                                onPressReadLess:
                                                                    () {
                                                                  /// specific method to be called on press to show less
                                                                },
                                                                lessStyle: TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                                moreStyle: TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                              ),
                                                            ),
                                                          )
                                                        ]),
                                                    RichText(
                                                        text: TextSpan(
                                                            text: "Board: ",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            children: [
                                                          TextSpan(
                                                              text:
                                                                  data.board ??
                                                                      "",
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
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
                                                  bottomRight:
                                                      Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10))),
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
                                                  "Class: ",
                                                  data.datumClass ?? "",
                                                  AssetImages.book),
                                              buildContainer(
                                                  "Subject: ",
                                                  data.subject ?? "",
                                                  AssetImages.pen),
                                              buildContainer(
                                                  "Teacher Preference: ",
                                                  data.teacherPrefarence ?? "",
                                                  AssetImages.teacherhed),
                                              buildContainer(
                                                  "Message from parents: ",
                                                  data.description ?? "",
                                                  AssetImages.needteacher),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                decoration: const BoxDecoration(
                                                    color: AppColor.main,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10))),
                                                child: Text(
                                                  "Contact Number: ${data.parentPhoneNumber}",
                                                  style: style18w500w,
                                                ),
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
                          ),
                        ),
                      ),
                    );
        },
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
