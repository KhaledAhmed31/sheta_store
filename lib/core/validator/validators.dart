class Validators {
 
  
  static String? nameValidator(String? val) {
    RegExp nameRegExp = RegExp('[a-zA-Z]');
    if (val == null) {
      return "Enter your name";
    } else if (val.isEmpty) {
      return "Enter your name";
    } else if (!nameRegExp.hasMatch(val)) {
      return "Enter valid name";
    } else {
      return null;
    }
  }

  static String? phoneValidator(String? val) {
    RegExp phoneRegExp = RegExp(r'\d');
    if (val == null) {
      return "Enter your number";
    } else if (val.isEmpty) {
      return "Enter your number";
    } else if (!phoneRegExp.hasMatch(val)) {
      return "Enter valid number";
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? val) {
    if (val == null || val.isEmpty) {
      return "Password is required";
    }
    if (val.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!val.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }
    if (!val.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter";
    }
    if (!val.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one numeric character";
    }
    if (!val.contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]'))) {
      return "Password must contain at least one special character";
    }
    return null;
  }

  static String? signInPasswordValidator(String? val) {
    if (val == null || val.isEmpty) {
      return "Password is required";
    }
    
    return null;
  }

  static String? emailValidator(String? val) {
    RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null) {
      return "Enter your email";
    } else if (val.isEmpty) {
      return "Enter your email";
    } else if (!emailRegExp.hasMatch(val)) {
      return "Enter valid email";
    } else {
      return null;
    }
  }
}
