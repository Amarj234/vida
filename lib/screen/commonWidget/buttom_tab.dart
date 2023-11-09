import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../commonfun/tab_provider.dart';
import '../../utils/color.dart';
import '../../utils/constimage.dart';

Widget buttomBar(BuildContext context) {
  return Consumer<HometabProvider>(
    builder: (context, provider, child) {
      return BottomNavigationBar(
          backgroundColor: const Color(0xff4F0E28),
          iconSize: 20,
          showUnselectedLabels: true,
          unselectedItemColor: const Color(0xffBF7C97),
          // unselectedIconTheme: const IconThemeData(color: Color(0xffBF7C97)),
          //selectedFontSize: 50,
          unselectedFontSize: 14,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  AssetImages.home,
                  color: Colors.white,
                ),
                icon: Image.asset(
                  AssetImages.home,
                  color: const Color(0xffBF7C97),
                ),
                label: 'Home',
                backgroundColor: AppColor.appbarcolor),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AssetImages.enquerysvg,
                  color: Colors.white,
                ),
                icon: SvgPicture.asset(AssetImages.enquerysvg),
                label: 'Enquiry',
                backgroundColor: AppColor.appbarcolor),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AssetImages.profilesvg,
                color: Colors.white,
              ),
              icon: SvgPicture.asset(
                AssetImages.profilesvg,
              ),
              label: 'Profile',
              backgroundColor: AppColor.appbarcolor,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.index,
          selectedItemColor: Colors.white,
          onTap: (index) {
            provider.onItemTapped(index);
          },
          elevation: 5);
    },
  );
}
