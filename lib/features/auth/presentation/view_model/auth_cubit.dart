import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // Login function
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("User logged in: ${userCredential.user?.email}");
      // Emit success state with the user information if needed
      emit(AuthSuccess(user: userCredential.user));
    } on FirebaseAuthException catch (e) {
      log("Error logging in: ${e.message}");
      emit(AuthFailure(errorMessage: e.message ?? 'Login failed.'));
    }
  }

  // Sign-up function
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Optionally, update the user's display name
      await userCredential.user?.updateDisplayName(name);

      log("User created: ${userCredential.user?.email}");
      emit(AuthSuccess(user: userCredential.user));
    } on FirebaseAuthException catch (e) {
      log("Error signing up: ${e.message}");
      emit(AuthFailure(errorMessage: e.message ?? 'Sign up failed.'));
    }
  }

  // Reset Password function
  Future<void> resetPassword({required String email}) async {
    emit(AuthLoading());

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: email);
      log("Password reset email sent to: $email");
      emit(PasswordResetSuccess());
    } on FirebaseAuthException catch (e) {
      log("Error sending password reset email: ${e.message}");
      emit(AuthFailure(errorMessage: e.message ?? 'Password reset failed.'));
    }
  }
}
