import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign-up function
  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Error during sign-up: $e');
      return null;
    }
  }

  // Sign-in function
  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Error during sign-in: $e');
      return null;
    }
  }

  // Sign-out function
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Returns the currently signed-in user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Checks if a user is signed in (auth state listener)
  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }

  // Password reset function
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Error during password reset: $e');
    }
  }
}
