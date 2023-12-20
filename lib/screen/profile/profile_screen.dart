import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vida/screen/profile/provider/student_profile_provider.dart';
import 'package:vida/utils/color.dart';

import '../../utils/constimage.dart';
import '../commonWidget/app_button.dart';
import 'edit_profile.dart';
import 'widget/name_fields.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    studentProfileProvider = Provider.of<StudentProfileProvider>(context, listen: false);

    studentProfileProvider!.getdata(context);
  }

  StudentProfileProvider? studentProfileProvider;
  String toCapitalized(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<StudentProfileProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                color: AppColor.radiocolr,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    toCapitalized(provider.parentProfile!.d.data.name),
                                    style: GoogleFonts.roboto(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(.3),
                                    //blurRadius: 5,
                                    spreadRadius: 12,
                                  ),
                                  BoxShadow(
                                    color: Colors.white.withOpacity(.5),
                                    //blurRadius: 5,
                                    spreadRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  NameFields(
                                    txt: toCapitalized(provider.parentProfile!.d.data.name),
                                    image: AssetImages.user,
                                  ),
                                  NameFields(
                                    txt: provider.parentProfile!.d.data.location.toString(),
                                    image: AssetImages.pointlocation,
                                  ),
                                  NameFields(
                                    txt: provider.parentProfile!.d.data.extraParm1.toString(),
                                    image: AssetImages.pointlocation,
                                  ),
                                  NameFields(
                                    txt: provider.parentProfile!.d.data.extraParm2.toString(),
                                    image: AssetImages.book,
                                  ),
                                  NameFields(
                                    txt: provider.parentProfile!.d.data.extraParm3.toString(),
                                    image: AssetImages.medal,
                                  ),
                                  NameFields(
                                    txt: provider.parentProfile!.d.data.extraParm4 == "M"
                                        ? "Male"
                                        : provider.parentProfile!.d.data.extraParm4 == "F"
                                            ? "Female"
                                            : "Any",
                                    image: AssetImages.gender,
                                  ),
                                  NameFields(
                                    txt: provider.parentProfile!.d.data.extraParm5.toString(),
                                    image: AssetImages.pen,
                                  ),
                                  NameFields(
                                    txt: provider.parentProfile!.d.data.phoneNo.toString(),
                                    image: AssetImages.mobile,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  AppButton(
                                    texcolor: Colors.white,
                                    hight: 30,
                                    txt: 'Edit',
                                    col: const Color(0xff421200),
                                    myfun: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const EditProfile()));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 150,
                          left: (MediaQuery.of(context).size.width / 2) - 48,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: AppColor.appbarcolor, shape: BoxShape.circle),
                            height: 96,
                            width: 96,
                            child: Text(
                              "${provider.parentProfile!.d.data.name.split(" ")[0][0].toUpperCase()}${provider.parentProfile!.d.data.name.split(" ").length == 2 ? provider.parentProfile!.d.data.name.split(" ")[1][0].toUpperCase() : ''}",
                              style: GoogleFonts.roboto(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
