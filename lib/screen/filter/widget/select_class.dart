import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/filer_provider.dart';
import 'filter_common.dart';

class SelectClass extends StatelessWidget {
  const SelectClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, provider, child) {
        return provider.isLoding
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                  Heading("Class"),
                  const SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: -10.0, // Horizontal space.
                    //runSpacing: 30.0, // gap between lines
                    children: provider.classlist.map((e) {
                      return InkWell(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          onTap: () {
                            provider.selectClass(e);
                          },
                          child: myChip(e, provider.slclass.contains(e)));
                    }).toList(),
                  ),
                ],
              );
      },
    );
  }
}
