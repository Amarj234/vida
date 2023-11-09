import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/color.dart';
import '../../../utils/style.dart';
import '../../selectlocation/provider/tabprovider.dart';

class RadeoButton extends StatelessWidget {
  const RadeoButton({Key? key, required this.isselect, required this.txt, this.val = 0})
      : super(key: key);
  final int isselect;
  final String txt;
  final double val;
  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, provider, child) {
        return InkWell(
          overlayColor: MaterialStateProperty.all(AppColor.appbarcolor),
          onTap: () {
            provider.SelectRadio(isselect);
          },
          child: Row(
            children: [
              SizedBox(
                width: val,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: provider.selectradeo == isselect
                          ? AppColor.radiocolr
                          : AppColor.appbarcolor,
                    ),
                    height: 12,
                    width: 12,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                txt,
                style: style16w400w,
              )
            ],
          ),
        );
      },
    );
  }
}
