import 'package:flutter/material.dart';
import 'package:my_music_list/models/user_model.dart';
import 'package:my_music_list/widgets/home_menu_drawer.dart';
import 'package:provider/provider.dart';

class HomeAlbumsScreen extends StatelessWidget {
  const HomeAlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
        builder: (context, userModel, child) => Scaffold(
              drawer: const HomeMenuDrawer(),
              appBar: AppBar(title: const Text('Albums')),
              body: Text('Hello ${userModel.currentUser?.displayName}!'),
            ));
  }
}
