import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vida/utils/color.dart';
import 'package:vida/utils/constimage.dart';

import '../../utils/style.dart';
import '../selectlocation/select_location.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.oreng,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetImages.backgroung),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Advantage of Vida - To Parents",
                style: GoogleFonts.roboto(
                    fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              mainHeadin(context,
                  "The fees of teachers is not very high as they are not needed to pay any amount to the consultancy or middlemen"),
              const SizedBox(
                height: 35,
              ),
              mainHeadin(context,
                  "Parent can choose a teacher as per their requirement from thousands of qualified and experienced teachers"),
              const SizedBox(
                height: 35,
              ),
              mainHeadin(context,
                  "Parents need to just put their requirements and they will get calls from the teachers"),
              const SizedBox(
                height: 35,
              ),
              mainHeadin(context,
                  "Please do not uninstall the app. Let the app remain in your mobile. Everyday 100's of teachers are getting added. Wherever you need a teacher just fill few details and get calls from qualified and experienced teachers"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetImages.backgroung),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const SelectLocation()));
                },
                child: Text(
                  "Skip",
                  style: style16w400w,
                ))
          ],
        ),
      ),
    );
  }

  Widget mainHeadin(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AssetImages.point),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 90,
          child: Text(
            text,
            style: style16w400w,
          ),
        )
      ],
    );
  }
}
