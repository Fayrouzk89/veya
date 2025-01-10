class ValidatorHelper
{
  static bool isEmailValid(String email) {
    String emailPattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Regular expression for email validation

    RegExp regExp = RegExp(emailPattern);

    if (!regExp.hasMatch(email)) {
      return false;
    }

    return true;
  }
  static bool isPhoneValid(String email) {
    String emailPattern =r'^\d{9,15}$'; // Regular expression for email validation

    RegExp regExp = RegExp(emailPattern);

    if (!regExp.hasMatch(email)) {
      return false;
    }

    return true;
  }

}