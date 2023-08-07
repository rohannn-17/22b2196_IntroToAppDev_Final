import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fcm/database.dart';
import 'package:flutter_fcm/models/expense.dart';

import 'models/info.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Info? _FirebaseUser(User? user) {
    return user != null ? Info(uid: user.uid) : null;
  }

  Stream<Info?> get user {
    return _auth.authStateChanges().map(_FirebaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _FirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future? registerEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print(user!.uid);
      List<Expense> Exp = []
          .map((dynamic item) =>
              Expense(category: item.category, expense: item.expense))
          .toList();

      await Database(uid: user?.uid).updateUser('new user', Exp);
      return _FirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future? signInEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print(user?.uid);
      return _FirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future? signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
