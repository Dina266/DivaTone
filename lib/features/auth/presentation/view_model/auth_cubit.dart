import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/app_images.dart';
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

      FirebaseFirestore.instance.collection('Users').doc(userCredential.user?.uid)
      .set({
          'name':name,
          'email':userCredential.user?.email
      });
      // Optionally, update the user's display name
      await userCredential.user?.updateDisplayName(name);
      

      log("User created: ${userCredential.user?.email}");
      log("User created: $name");
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

  // Logout function
  Future<void> logout() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      log("User logged out");
      emit(AuthLoggedOutState());
    } catch (e) {
      log("Error logging out: $e");
      emit(AuthFailure(errorMessage: 'Logout failed.'));
    }
  }

  // Change Display Name function
  Future<void> changeDisplayName({required String newName}) async {
    emit(AuthLoading());

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(newName);
        FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .update({'name': newName});

        log("Display name updated to: $newName");
        emit(AuthSuccess(user: user));
      } else {
        emit(AuthFailure(errorMessage: 'No user found.'));
      }
    } catch (e) {
      log("Error updating display name: $e");
      emit(AuthFailure(errorMessage: 'Display name update failed.'));
    }
  }

  // Change Password function
  Future<void> changePassword({required String newPassword}) async {
    emit(AuthLoading());

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        log("Password updated");
        emit(AuthSuccess(user: user));
      } else {
        emit(AuthFailure(errorMessage: 'No user found.'));
      }
    } catch (e) {
      log("Error updating password: $e");
      emit(AuthFailure(errorMessage: 'Password update failed.'));
    }
  }

  // Change Profile Image function
  Future<void> changeProfileImage({required String newImageUrl}) async {
    emit(AuthLoading());

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(newImageUrl);
        FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .update({'imageUrl': newImageUrl});

        log("Profile image updated");
        emit(ChangeProfileSuccess());
      } else {
        emit(AuthFailure(errorMessage: 'No user found.'));
      }
    } catch (e) {
      log("Error updating profile image: $e");
      emit(AuthFailure(errorMessage: 'Profile image update failed.'));
    }
  }
}
