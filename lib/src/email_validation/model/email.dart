import 'package:formz/formz.dart';

/// Validation State of a user name.
enum EmailValidationError {
  /// This [EmailValidationError] is triggered when the user name is empty
  /// after a user trying to fill it and have removed the typed text.
  empty,

  /// This [EmailValidationError] is triggered when the
  notValid,
}

class Email extends FormzInput<String, EmailValidationError> {
  /// This constructor build an empty email.
  const Email.pure({String value = ''}) : super.pure(value);

  /// This constructor build an email that has already
  /// stored a value.
  const Email.dirty({String value = ''}) : super.dirty(value);

  /// The function that check the validity of the field as email.
  @override
  EmailValidationError? validator(String value) {
    var validEmail = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.+[a-zA-Z]+$');

    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else if (validEmail.matchAsPrefix(value) == null) {
      return EmailValidationError.notValid;
    }
    return null;
  }
}
