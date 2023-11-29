import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/commonfun/tab_provider.dart';

import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/costum_snackbar.dart';
import '../otplogin/login_screen.dart';
import '../personalDetails/personal_details.dart';
import '../personalDetails/teacher_personaldetails.dart';
import 'provider/tabprovider.dart';
import 'widget/buttoncheckbox.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation(
      {Key? key, required this.uid, required this.rid, required this.mobile})
      : super(key: key);
  final int uid;
  final int rid;
  final String mobile;

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  TabProvider? tabProvider;

  @override
  void initState() {
    final pro = Provider.of<HometabProvider>(context, listen: false);
    tabProvider = Provider.of<TabProvider>(context, listen: false);
    tabProvider!.setdata(widget.uid);
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pro.changeUid(widget.uid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appbackground2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 25, right: 25),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetImages.vida),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.uid == 1
                              ? "I Need A Teacher"
                              : "I Need Students",
                          style: GoogleFonts.roboto(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff421200)),
                        ),
                      ],
                    ),
                    Consumer<TabProvider>(
                      builder: (context, provider, child) {
                        return provider.isLoding
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                children: [
                                  for (int i = 0;
                                      i < provider.parents.length;
                                      i++) ...[
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    ButtonCheckbox(
                                      txt: provider.parents[i],
                                      val: provider.parents[i],
                                    ),
                                  ]
                                ],
                              );
                      },
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              myfun: () {
                if (tabProvider!.tabval.length > 0) {
                  if (widget.uid == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalDetaild(
                                  rid: widget.rid.toString(),
                                  mobile: widget.mobile,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherPersonalDetaild(
                                  rid: widget.rid.toString(),
                                  mobile: widget.mobile,
                                )));
                  }
                } else {
                  CostomSnackbar.show(context, "Please Select Place ");
                }
              },
              txt: 'CONTINUE',
              col: AppColor.main,
              hight: 50,
            ),
          ],
        ),
      ),
    );
  }
}
