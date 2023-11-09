import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vida/commonfun/tab_provider.dart';
import '../screen/filter/provider/filer_provider.dart';

import '../screen/selectlocation/provider/tabprovider.dart';

class AppProvider {
  AppProvider._();

  static final AppProvider appProvider = AppProvider._();

  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => TabProvider()),
      ChangeNotifierProvider(create: (_) => HometabProvider()),
      ChangeNotifierProvider(create: (_) => FilterProvider()),
    ];
  }
}
