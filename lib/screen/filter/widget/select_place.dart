import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/filer_provider.dart';
import 'filter_common.dart';

class SelectPlace extends StatelessWidget {
  const SelectPlace({Key? key, required this.text}) : super(key: key);
  final String text;
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
            Heading(text),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: -10.0, // gap between lines
              children: provider.placevalue.map((e) {
                return InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.white),
                    onTap: () {
                      provider.selectPlace(e);
                    },
                    child: mychip(e, provider.place.contains(e)));
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
