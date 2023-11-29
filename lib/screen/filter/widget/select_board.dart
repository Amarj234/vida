import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/filer_provider.dart';
import 'filter_common.dart';

class SelectBoard extends StatelessWidget {
  const SelectBoard({Key? key}) : super(key: key);

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
                  Heading("Board"),
                  const SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: -10.0, // gap between lines
                    children: provider.bordlist.map((e) {
                      return InkWell(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          onTap: () {
                            provider.selectBoard(e);
                          },
                          child: myChip(e, provider.board.contains(e)));
                    }).toList(),
                  ),
                ],
              );
      },
    );
  }
}
