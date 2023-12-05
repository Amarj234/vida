import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../notification/notification.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar(
      {Key? key,
      this.title,
      this.actions,
      required this.context,
      this.leading = false,
      this.ontap})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String? title;
  final bool? actions;
  final bool leading;
  final BuildContext context;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leading ? 50 : 120,
      backgroundColor: AppColor.appbarcolor,
      leading: leading
          ? InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AssetImages.arrowback))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AssetImages.appbarsvg,
                height: 35,
              ),
            ),
      // automaticallyImplyLeading: automaticallyImplyLeading ?? true,

      actions: [
        // Image.asset(AssetImages.appbaricon),
        InkWell(
          overlayColor: MaterialStateProperty.all(AppColor.main),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: badges.Badge(
              badgeStyle: const BadgeStyle(
                badgeColor: AppColor.yello,
              ),
              badgeContent: const Text('0'),
              child: SvgPicture.asset(
                AssetImages.bellsvg,
                width: 23,
                height: 23,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          overlayColor: MaterialStateProperty.all(AppColor.main),
          onTap: ontap,
          child: SvgPicture.asset(
            AssetImages.menusvg,
            width: 23,
            height: 23,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
      title: Text(
        title ?? "",
        style: GoogleFonts.roboto(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      toolbarHeight: 60,
      elevation: 0,
      // flexibleSpace: leading == false
      //     ? Padding(
      //         padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 1.6, top: 30),
      //         child: SvgPicture.asset(AssetImages.appbarsvg),
      //       )
      //     : Container(),
    );
  }
}
