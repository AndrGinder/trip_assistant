class NameUtils {
  static final label = "Full name";

  static final emptyError = "Full name is required";
}

class EmailUtils {
  static final label = "Email";

  static final emptyError = "Email is required";
  static final matchError = "Email is not valid";

  static final regexValidator = RegExp(r'\S+@\S+\.\S+');
}

class PasswordUtils {
  static final label = "Password";

  static final emptyError = "Password is required";
  static final lengthError = "Password must be at least $minLength characters long";
  static final matchError = "Password must contain at least one uppercase letter, "
    "one lowercase letter, one digit, and one special character";

  static final minLength = 8;
  static final maxLength = 32;

  static final regexFormatter = RegExp(r'[A-Za-z\d@$!%*?&._-]');
  static final regexValidator = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&._-])[A-Za-z\d@$!%*?&._-]{8,}$'
  );
}