import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/commonfun/tab_provider.dart';

import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../commonWidget/app_button.dart';
import '../otplogin/login_screen.dart';
import 'widget/buttoncheckbox.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key, required this.uid}) : super(key: key);
  final int uid;
  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  List parents = [];

  @override
  void initState() {
    final pro = Provider.of<HometabProvider>(context, listen: false);

    pro.changeUid(widget.uid);
    parents = [];
    parents = widget.uid == 1
        ? ["At my place", "At teacher’s place", "In a coaching center", "Online class"]
        : ["At Student’s place", "At My place", "At My Coaching Center"];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appbackground2,
      body: SafeArea(
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
                        widget.uid == 1 ? "I Need A Teacher" : "I Need Students",
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff421200)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      for (int i = 0; i < parents.length; i++) ...[
                        const SizedBox(
                          height: 17,
                        ),
                        ButtonCheckbox(
                          txt: parents[i],
                          val: i,
                        ),
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              myfun: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(
                              uid: widget.uid,
                            )));
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
