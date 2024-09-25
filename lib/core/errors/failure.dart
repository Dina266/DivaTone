import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class AuthFailure extends Failure {
  AuthFailure(super.errorMessage);

  factory AuthFailure.firebaseAuth(
      FirebaseAuthException firebaseAuthException) {
    if (firebaseAuthException.code == 'user-not-found') {
      return AuthFailure('User Not Found');
    } else if (firebaseAuthException.code == 'wrong-password') {
      return AuthFailure('Wrong Password');
    } else if (firebaseAuthException.code == 'weak-password') {
      return AuthFailure('Weak Password');
    } else if (firebaseAuthException.code == 'email-already-in-use') {
      return AuthFailure('this email already exists');
    } else {
      return AuthFailure('Something Went Wrong');
    }
  }
}