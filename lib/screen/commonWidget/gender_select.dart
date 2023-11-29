import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:vida/utils/style.dart';

import '../../utils/color.dart';
import '../selectlocation/provider/tabprovider.dart';

class GenderSelect extends StatelessWidget {
  const GenderSelect({Key? key, required this.myfun, this.header = "Gender"})
      : super(key: key);
  final Function(int val) myfun;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          //color: provider.tabval.contains(val) ? Colors.white : AppColor.appbackground2,
          // border: Border.all(color: AppColor.oreng.withOpacity(.5)),
          border: const GradientBoxBorder(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffF5A925),
                  Color(0xffED6237),
                ]),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: style16w500,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              radeoButton("Male", 0),
              radeoButton("Female", 1),
              radeoButton("Other", 2),
              Container(
                width: 50,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget radeoButton(String txt, int isselect) {
    return Consumer<TabProvider>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            provider.SelectRadio(isselect);
            myfun(isselect);
          },
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.radiocolr,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: provider.selectradeo == isselect
                          ? AppColor.radiocolr
                          : Colors.white,
                    ),
                    height: 12,
                    width: 12,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                txt,
                style: style16w400,
              )
            ],
          ),
        );
      },
    );
  }
}
