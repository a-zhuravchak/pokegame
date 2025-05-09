import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  Future<User?> registerWithEmail(String email, String password);

  Future<User?> signInWithEmail(String email, String password);

  Future<void> signOut();

  User? get currentUser;
}
