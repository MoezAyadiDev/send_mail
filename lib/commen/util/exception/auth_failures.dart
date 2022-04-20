// invalid-email:
// Thrown if the email address is not valid.
// user-disabled:
// Thrown if the user corresponding to the given email has been disabled.
// user-not-found:
// Thrown if there is no user corresponding to the given email.
// wrong-password:
// Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.

import 'package:send_mail/commen/util/exception/failures.dart';

enum firebaseError { invalidEmail, userDisabled, userNotFound, wrongPassword }

class AuthentificationFailure implements Failures {
  final String error;
  final String? message;
  const AuthentificationFailure({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [error, message];

  @override
  bool? get stringify => true;
}
