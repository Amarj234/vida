import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/filer_provider.dart';
import 'filter_common.dart';

class SelectTeacher extends StatelessWidget {
  const SelectTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            gBorder(),
            const SizedBox(
              height: 15,
            ),
            Heading("Preference Teacher"),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: -10.0, // gap between lines
              children: provider.teachergenvalue.map((e) {
                return InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    onTap: () {
                      provider.selectTeacher(e);
                    },
                    child: mychip(e, provider.teachergen.contains(e)));
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
