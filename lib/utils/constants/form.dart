abstract class NameUtils {
  static final String label = "Full name";
  static final String emptyError = "Full name is required";
}

abstract class EmailUtils {
  static final String label = "Email";
  static final String emptyError = "Email is required";
  static final String matchError = "Email is not valid";

  static final regexValidator = RegExp(r'\S+@\S+\.\S+');
}

abstract class PasswordUtils {
  static final String label = "Password";
  static final String emptyError = "Password is required";
  static final String lengthError = "Password must be at least $minLength characters long";
  static final String matchError = "Password must contain at least one uppercase letter, "
    "one lowercase letter, one digit, and one special character";

  static final minLength = 8;
  static final maxLength = 32;

  static final regexFormatter = RegExp(r'[A-Za-z\d@$!%*?&._-]');
  static final regexValidator = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&._-])[A-Za-z\d@$!%*?&._-]{8,}$'
  );
}

abstract class TripNameUtils {
  static final String label = "Name";
  static final String hint = "Describe your trip in a few words";
  static final String emptyError = "Name is required";
}

abstract class TripDestinationUtils {
  static final String label = "Destination";
  static final String hint = "Where are you going?";
  static final String emptyError = "Destination is required";
}

abstract class TripPurposeUtils {
  static final String label = "Purpose";
  static final String hint = "What is the purpose of your trip?";
  static final String emptyError = "Purpose is required";
}

abstract class TripWeatherUtils {
  static final String label = "Weather";
  static final String hint = "What is the expected weather?";
  static final String emptyError = "Weather information is required";
}

class TripUtils {
  static final String headline = "Fill the general conditions of your trip";
  static final String snackAdd = "New trip added successfully!";
  static final String snackUpdate = "Trip updated successfully!";
  static final String snackError = "Something went wrong. Please try again.";
}

class AuthUtils {
  static final String snackSignUp = "You are succesfully signed up!";
  static final String snackSignIn = "You are succesfully signed in!";
  static final String snackSignOut = "You are succesfully signed out!";
  static final String snackError = "Something went wrong. Please try again.";
}