import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Controller class for handling authentication business logic.
class AuthController {
  /// Registers a new user with a given username, email, and password.
  /// Returns a user if successful.
  static Future<User?> registerWithEmailAndPassword(
      {required String username,
      required String email,
      required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      // Try to create the user with the given credentials.
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Set the given username as the user's display name.
      user = userCredential.user;
      await user!.updateDisplayName(username);
      await user.reload();
      // Get the current user.
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      // TODO: Handle firebase error(s) by adding an alert (maybe create an alert class)
      print(e);
    } catch (e) {
      print(e);
    }

    return user;
  }

  /// Signs in a user with a given email and password.
  /// Returns a user if successful.
  static Future<User?> signInUsingEmailAndPassword(
      {required String email, required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      // Try to sign the user in with the given credentials.
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      // TODO: Handle firebase error(s) by adding an alert (maybe create an alert class)
      print(e);
    } catch (e) {
      print(e);
    }

    return user;
  }

  /// Signs in a user with a Google account.
  /// Returns a user if successful.
  /// See https://firebase.google.com/docs/auth/flutter/federated-auth#google
  static Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow.
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request.
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential.
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    // Once signed in, return the User.
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user);
    return userCredential.user;
  }

  /// Signs out the current user.
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// Refreshes the given user.
  /// Returns the refreshed user.
  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
