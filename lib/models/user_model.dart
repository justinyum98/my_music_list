import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Widget that manages user state.
class UserModel extends ChangeNotifier {
  User? currentUser = FirebaseAuth.instance.currentUser;

  /// Saves the given user object and notifies all listeners.
  void signIn(User user) {
    currentUser = user;
    notifyListeners();
  }

  /// Sets the user to null and notifies all listeners.
  void signOut() {
    currentUser = null;
    notifyListeners();
  }

  /// Returns true if user is set, otherwise return false.
  bool isSignedIn() => currentUser != null;
}
