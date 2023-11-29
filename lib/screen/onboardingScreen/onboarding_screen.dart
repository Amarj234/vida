import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../commonfun/tab_provider.dart';
import '../../config/sharedPrefs.dart';
import '../../utils/color.dart';
import '../../utils/constimage.dart';
import '../home_screen.dart';
import '../splase/select_register.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({
    super.key,
  });

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      determineScreen();
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => const SelectRegister()));
      // // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  determineScreen() {
    UserPrefs prefs = UserPrefs();
    //prefs.clearPrefs();
    String? token = prefs.getToken();
    String? fcmtoken = prefs.getFCMToken();

    String? login = prefs.getData("login");
    String? name = prefs.getData("name");
    final pro = Provider.of<HometabProvider>(context, listen: false);

    log(" token : $token name: $name fcm $fcmtoken");
//initAutoStart();
    print("Screen check $login");
    if (login == "yes") {
      int? rid = int.parse(prefs.getData("rid").toString());
      pro.changeUid(rid!);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SelectRegister()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      body: Center(child: Image.asset(AssetImages.appmain)),
    );
  }
}
