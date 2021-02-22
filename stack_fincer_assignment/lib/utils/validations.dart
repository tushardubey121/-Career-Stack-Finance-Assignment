String validatePhone(String value) {
  Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,10}$)';
  RegExp regex = new RegExp(pattern);
  if (value == null || value.trim().isEmpty) {
    return "Empty phone number";
  } else if (!regex.hasMatch(value))
    return "Mobile number you have entered is invalid";
  else
    return null;
}

String validateZip(String value) {
  Pattern pattern = r'^[0-9]{5}$';
  RegExp regex = new RegExp(pattern);
  if (value == null || value.trim().isEmpty) {
    return "Empty zipcode";
  } else if (!regex.hasMatch(value))
    return "Zipcode you have entered is invalid";
  else
    return null;
}

String validateName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value == null) {
    return "Name required";
  } else if (value.trim().isEmpty) {
    return "Name Required";
  } else if (!regExp.hasMatch(value.trim())) {
    return "Invalid name";
  } else
    return null;
}

String validateFirstName(String value) {
  String pattern = r'(^[a-zA-Z]*$)';
  RegExp regExp = RegExp(pattern);
  if (value == null) {
    return "First name required";
  } else if (value.trim().isEmpty) {
    return "First name required";
  } else if (!regExp.hasMatch(value.trim())) {
    return "Invalid first name";
  } else
    return null;
}

String validateLastName(String value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value == null) {
    return "Last name required";
  } else if (value.trim().isEmpty) {
    return "Last name required";
  } else if (!regExp.hasMatch(value.trim())) {
    return "Invalid last name";
  } else
    return null;
}

String validateAddress(String value) {
  if (value == null || value.trim().isEmpty) {
    return "Address required";
  } else
    return null;
}

String validateUserName(String value) {
  if (value == null || value.trim().isEmpty) {
    return "Username required";
  } else
    return null;
}

String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,3}))$';
  RegExp regExp = new RegExp(pattern);
  if (value == null || value.trim().isEmpty) {
    return "Email is required";
  } else if (!regExp.hasMatch(value)) {
    return "Email address you have entered is invalid";
  } else
    return null;
}

String validatePassword(String value) {
  String pattern = r'^(?=.*[0-9])(?=.*[a-z]).{7,}$';
  RegExp regExp = RegExp(pattern);
  if (value == null || value.trim().isEmpty) {
    return "Password required";
  } else if (value.contains(" ")) {
    return "Space not allowed";
  } else if (!regExp.hasMatch(value)) {
    return "Password must like this ab1234";
  } else
    return null;
}
