import 'package:flutter/material.dart';
import 'package:my_music_list/controllers/auth_controller.dart';
import 'package:my_music_list/models/user_model.dart';
import 'package:provider/provider.dart';

class HomeMenuDrawer extends StatelessWidget {
  const HomeMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Consumer<UserModel>(
            builder: (context, userModel, child) =>
                ListView(padding: EdgeInsets.zero, children: [
                  UserAccountsDrawerHeader(
                    accountName: Text('${userModel.currentUser?.displayName}'),
                    accountEmail: Text('${userModel.currentUser?.email}'),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage:
                            NetworkImage('${userModel.currentUser?.photoURL}')),
                  ),
                  ListTile(
                      leading: const Icon(
                        Icons.logout,
                      ),
                      title: const Text('Sign out'),
                      onTap: () async {
                        await AuthController.signOut();
                        userModel.signOut();
                      })
                ])));
  }
}
