import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/screen/enquiry/provider/teacher_enquiry_provider.dart';
import 'package:vida/screen/enquiry/widget/visible_button.dart';
import 'package:vida/utils/color.dart';

import '../subscribe/widget/butto.dart';
import 'teacher_enquiry.dart';

class MyEnquiry extends StatefulWidget {
  const MyEnquiry({Key? key}) : super(key: key);

  @override
  State<MyEnquiry> createState() => _MyEnquiryState();
}

class _MyEnquiryState extends State<MyEnquiry> {
  TeacherEnquiryProvider? teacherEnquiryProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teacherEnquiryProvider =
        Provider.of<TeacherEnquiryProvider>(context, listen: false);
    teacherEnquiryProvider!.getlist(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.radiocolr,
      body: Consumer<TeacherEnquiryProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Enquiry",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TeacherEnquiry()));
                                  },
                                  child:
                                      appButton("SUBMIT YOUR QUERY", context)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: provider.teacherEqList == null
                                ? Center(
                                    child: Text("Data Not found"),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        provider.teacherEqList!.data.length,
                                    itemBuilder: (context, index) {
                                      final data =
                                          provider.teacherEqList!.data[index];
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                36,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Enquiry for ${data.board} Board",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor.main),
                                                ),
                                                Text(
                                                  provider.Formatedate(data
                                                      .createdAt
                                                      .toString()),
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xffA3A3A3)),
                                                ),
                                              ],
                                            ),
                                            border(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data.datumClass ?? "",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColor.main),
                                                ),
                                                Container(
                                                  width: 9,
                                                  height: 9,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xffFFB396)),
                                                ),
                                                Text(
                                                  data.subject ?? "",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColor.main),
                                                ),
                                                Container(
                                                  width: 20,
                                                )
                                              ],
                                            ),
                                            border(),
                                            RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    text:
                                                        "Teacher Preference: ",
                                                    style: GoogleFonts.roboto(
                                                      color: AppColor.main,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: data.teacherPrefarence ==
                                                                "M"
                                                            ? "Male"
                                                            : data.teacherPrefarence ==
                                                                    "F"
                                                                ? "Female"
                                                                : "Any" ?? "",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color: AppColor.main,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ])),
                                            border(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              data.description ?? "",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0xff333333)),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            const VisibleButton(
                                                txt:
                                                    "2 Teachers View Your Requirement"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
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

  Container border() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 1,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xffDBDBDB)),
    );
  }
}
