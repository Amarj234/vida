import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../commonfun/tab_provider.dart';
import 'commonWidget/buttom_tab.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return provider.myPageList[provider.index];
          },
        ));
  }
}
