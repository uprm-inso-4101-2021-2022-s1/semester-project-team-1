

// matching various patterns for kinds of data

class Validator {

  String email(String value) {
     Pattern pattern = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'labels.validator.email';
    else
      return null;
  }

  String password(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'labels.validator.password';
    else
      return null;
  }

  String name(String value) {
    Pattern pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'labels.validator.name';
    else
      return null;
  }

  String number(String value) {
    Pattern pattern = r'^[0-9]';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'labels.validator.number';
    else
      return null;
  }

    String phoneNumber(String value) {
    Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "Don't use spaces or '-' ";
    else
      return null;
  }
  String memberNumber(String value) {
    Pattern pattern = r'^\d{4}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return "Enter your Member ID";
    else
      return null;
  }

  String amount(String value) {
    Pattern pattern = r'^\d+$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'labels.validator.amount';
    else
      return null;
  }

  String notEmpty(String value) {
    if (value.isEmpty)
      return 'labels.validator.notEmpty';
    else
      return null;
  }
}
