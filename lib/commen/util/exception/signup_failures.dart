// email-already-in-use:
// Thrown if there already exists an account with the given email address.
// invalid-email:
// Thrown if the email address is not valid.
// operation-not-allowed:
// Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
// weak-password:
// Thrown if the password is not strong enough.

import 'package:send_mail/commen/util/exception/failures.dart';

class SignUpFailure implements Failures {
  final String error;
  final String? message;
  const SignUpFailure({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [error, message];

  @override
  bool? get stringify => true;
}
