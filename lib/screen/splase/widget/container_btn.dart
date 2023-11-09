import 'package:flutter/material.dart';
import '../../../utils/style.dart';

class ContainerBtn extends StatelessWidget {
  const ContainerBtn(
      {Key? key, required this.image, required this.text, required this.myfun, required this.col})
      : super(key: key);
  final String image;
  final String text;
  final Color col;
  final Function() myfun;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: myfun,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              height: 40,
            ),
            Container(
              width: 1,
              height: 35,
              color: text == "PARENT" ? const Color(0xffFFB547) : const Color(0xffF97C46),
            ),
            Text(
              text,
              style: style18w400b,
            ),
            Container(
              width: text == "PARENT" ? 30 : 36,
            ),
            const Icon(Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }
}
