class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }

    final password = value.trim();

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    final hasUpper = RegExp(r'[A-Z]').hasMatch(password);
    final hasLower = RegExp(r'[a-z]').hasMatch(password);
    final hasDigit = RegExp(r'\d').hasMatch(password);

    if (!hasUpper || !hasLower || !hasDigit) {
      return 'Password must include upper, lower letters and a number';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegExp = RegExp(r'^[0-9]{11}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    if (value.length != 11) {}
    return null;
  }

  static String? isEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
