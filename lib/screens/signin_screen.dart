import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:my_music_list/controllers/auth_controller.dart';
import 'package:my_music_list/models/user_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Consumer<UserModel>(
                builder: (context, userModel, child) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('MyMusicList',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32)),
                          const SizedBox(height: 60),
                          SignInButton(Buttons.GoogleDark, onPressed: () async {
                            User? user =
                                await AuthController.signInWithGoogle();
                            // If the user is signed in...
                            if (user != null) {
                              // Update user state.
                              userModel.signIn(user);
                            }
                          })
                        ]))));
  }
}
