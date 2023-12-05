// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commonfun/tab_provider.dart';
import 'commonWidget/buttom_tab.dart';
import 'commonWidget/costum_snackbar.dart';
import 'commonWidget/main_appbar.dart';
import 'menu/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.index}) : super(key: key);
  final int? index;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pro = Provider.of<HometabProvider>(context, listen: false);
    if (widget.index != null) {
      pro.index = widget.index!;
    }
  }

  int waitForSecondBackPress = 2;
  int onFirstBackPress = 1;

  void resetBackTimeout() {
    Future.delayed(const Duration(seconds: 2), () {
      onFirstBackPress = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onFirstBackPress == 1) {
          onFirstBackPress = 2;
          CostomSnackbar.show(context, 'Press back again to exit app',
              color: Colors.black);

          resetBackTimeout();
          return false;
        } else {
          Navigator.of(context).pop(true);
          exit(0);
        }
      },
      child: Scaffold(
          endDrawer: const SideMenu(),
          key: scaffoldKey,
          appBar: MainAppbar(
            ontap: () {
              if (scaffoldKey.currentState!.isEndDrawerOpen) {
                scaffoldKey.currentState!.closeEndDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openEndDrawer();
                //open drawer, if drawer is closed
              }
            },
            context: context,
          ),
          bottomNavigationBar: buttomBar(context),
          body: Consumer<HometabProvider>(
            builder: (context, provider, child) {
              return provider.uid == 1
                  ? provider.myPageList[provider.index]
                  : provider.myPageList2[provider.index];
            },
          )),
    );
  }
}
