import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Register success');
    } on FirebaseAuthException catch (e) {
      log('Register error: ${e.message.toString()}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      log('Login success');
    } on FirebaseAuthException catch (e) {
      log('Login error: ${e.message.toString()}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      log('logout success');
    } catch (e) {
      log('logout error: ${e.toString()}');
      rethrow;
    }
  }
}