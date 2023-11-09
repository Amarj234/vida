class Validations {
  bool validatePhone(String phone) {
    String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    final reg = RegExp(pattern);

    if (phone.length != 10) {
      return false;
    }
    if (reg.hasMatch(phone)) {
      return true;
    }
    return false;
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
