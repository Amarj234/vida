import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:vida/utils/color.dart';
import 'package:vida/utils/constimage.dart';
import 'package:vida/utils/style.dart';

import '../provider/tabprovider.dart';

class ButtonCheckbox extends StatelessWidget {
  const ButtonCheckbox({Key? key, required this.val, required this.txt}) : super(key: key);
  final int val;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            provider.SelectTab(val);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 13),
            decoration: BoxDecoration(
                color: provider.tabval.contains(val) ? Colors.white : AppColor.appbackground2,
                // border: Border.all(color: AppColor.oreng.withOpacity(.5)),
                border: const GradientBoxBorder(
                  gradient: LinearGradient(colors: [
                    Color(0xffF5A925),
                    Color(0xffED6237),
                  ]),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: provider.tabval.contains(val) ? AppColor.oreng : Colors.white,
                      border: Border.all(
                          color:
                              provider.tabval.contains(val) ? AppColor.oreng : AppColor.textcolor)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(AssetImages.right),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    txt,
                    style: style16w400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
