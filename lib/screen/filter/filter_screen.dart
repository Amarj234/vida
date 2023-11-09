import 'package:flutter/material.dart';
import 'package:vida/screen/filter/widget/select_board.dart';
import 'package:vida/screen/filter/widget/select_class.dart';
import 'package:vida/screen/filter/widget/select_teacher.dart';

import '../../utils/style.dart';
import '../commonWidget/app_button.dart';
import '../commonWidget/cancel_button.dart';
import '../commonWidget/main_appbar.dart';
import '../menu/side_menu.dart';
import 'provider/filer_provider.dart';
import 'widget/select_place.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  FilterProvider? filter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filter = Provider.of<FilterProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      endDrawer: const SideMenu(),
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
        leading: true,
        context: context,
        title: "Filter",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          filter!.clearFilter();
                        },
                        child: Text(
                          "Clear Filters",
                          style: style14w400w,
                        ),
                      )
                    ],
                  ),
                ),
                const SelectBoard(),
                const SelectTeacher(),
                const SelectClass(),
                const SelectPlace(),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AppButton(
                    texcolor: Colors.white,
                    hight: 30,
                    txt: 'APPLY',
                    col: const Color(0xff421200),
                    myfun: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => PersonalDetaild()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CancelButton(
                  txt: 'Cancel',
                  hight: 30,
                  myfun: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
