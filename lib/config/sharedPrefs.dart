import 'package:get_storage/get_storage.dart';

class UserPrefs {
  final box = GetStorage();

  final userToken = 'token';
  final phone = 'phone';
  final name = 'name';
  final userId = 'userId';
  final regDone = 'regDone';
  final splashSeen = 'splashSeen';
  final fcmtoken = 'fcmToken';

  List cartlist = [];

  //============================================

  setcart(Map data) {
    if (checkCart(data['proid']) == false) {
      if (box.read("cart") != null) {
        List olddata = box.read("cart");

        cartlist.addAll(olddata);
      }
      cartlist.add(data);
      box.write("cart", cartlist);
    }
  }

  cartclear() {
    box.remove("cart");
  }
  //

  bool checkCart(num id) {
    if (box.read("cart") != null) {
      List olddata = box.read("cart");
      for (int i = 0; i < olddata.length; i++) {
        if (olddata[i]["proid"] == id) {
          return true;
        }
      }
      return false;
    }
    return false;
  }

  updateQty(Map data) {
    if (box.read("cart") != null) {
      List olddata = box.read("cart");
      cartlist = olddata;
      for (int i = 0; i < olddata.length; i++) {
        if (olddata[i]["proid"] == data['proid']) {
          cartlist[i]['qty'] = data['qty'];
        }
      }
    }

    box.write("cart", cartlist);
  }

  removecart(Map data) {
    if (box.read("cart") != null) {
      List olddata = box.read("cart");
      cartlist = olddata;
      for (int i = 0; i < olddata.length; i++) {
        if (olddata[i]["proid"] == data['proid']) {
          cartlist.removeAt(i);
        }
      }
    }

    box.write("cart", cartlist);
  }

  List? getcart() {
    return box.read("cart");
  }

  void setToken(String token) {
    box.write(userToken, token);
  }

  String? getToken() {
    return box.read(userToken);
  }

  setData(String key, String val) {
    box.write(key, val);
  }

  setInt(String key, int val) {
    box.write(key, val);
  }

  int? getInt(String key) {
    return box.read(key);
  }

  String? getData(String key) {
    return box.read(key);
  }

  void saveFCMToken(String value) {
    box.write(fcmtoken, value);
  }

  String? getFCMToken() {
    return box.read(fcmtoken);
  }

  clearPrefs() async {
    await box.erase();
  }
}
