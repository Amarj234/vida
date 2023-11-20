import 'package:flutter/cupertino.dart';
import 'package:vida/model/getlocation_model.dart';

import '../../../commonfun/get_location.dart';

class StudentListProvider extends ChangeNotifier {
  String? culocation = "";

  getAddress() async {
    LocationModel? data = await GetLocation().getLatLong();
    print("mylocation234 $data");
    if (data != null) {
      culocation = data.locationname;
      notifyListeners();
    }
  }
}
