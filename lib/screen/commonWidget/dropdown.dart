import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../utils/constimage.dart';

class DropDown extends StatelessWidget {
  const DropDown(
      {Key? key,
      required this.list,
      required this.hint,
      required this.mayfun,
      required this.dropdownState})
      : super(key: key);
  final List<String> list;
  final String hint;
  final Function(String val) mayfun;
  final GlobalKey dropdownState;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          //color: provider.tabval.contains(val) ? Colors.white : AppColor.appbackground2,
          // border: Border.all(color: AppColor.oreng.withOpacity(.5)),
          border: const GradientBoxBorder(
            gradient:
                LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
              Color(0xffF5A925),
              Color(0xffED6237),
            ]),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonFormField(
        key: dropdownState,
        icon: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Image.asset(AssetImages.drop),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hint';
          }
          return null;
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        hint: Text(hint),
        items: list
            .map((label) => DropdownMenuItem(
                  value: label,
                  child: Text(label.toString()),
                ))
            .toList(),

        onChanged: (value) {
          mayfun(value!);
        }, //what you need for height
      ),
    );
  }
}
