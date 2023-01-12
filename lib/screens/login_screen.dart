import 'package:flutter/material.dart';
import 'package:my_music_list/controllers/auth_controller.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  const Text('MyMusicList'),
                  SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        AuthController.signInWithGoogle();
                      }
                  )
                ]
            )
        )
    );
  }
}
