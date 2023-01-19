import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:my_music_list/controllers/auth_controller.dart';
import 'package:my_music_list/models/user_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key, required this.onSignIn});

  final Function(User) onSignIn;

  /// Handles sign in event.
  /// Initiates Google sign in and returns a user if successful.
  /// If successful, passes user into onSignIn callback.
  /// If not
  void handleSignIn(BuildContext context) async {
    try {
      User? user = await AuthController.signInWithGoogle();
      if (user != null) {
        onSignIn(user);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      final errorSnackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          const Text('MyMusicList',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
          const SizedBox(height: 60),
          SignInButton(Buttons.GoogleDark, onPressed: () async {
            handleSignIn(context);
          })
        ])));
  }
}
