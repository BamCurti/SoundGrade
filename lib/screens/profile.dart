import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/widgets/searchBar.dart';
import 'package:soundgrade/widgets/bottomNav.dart';
import 'package:soundgrade/screens/login.dart';
import 'package:soundgrade/screens/feed.dart';
import 'package:soundgrade/screens/playlists.dart';
import 'package:soundgrade/utils/style.dart';
import 'package:soundgrade/utils/theme_notifier.dart';
import 'package:soundgrade/utils/camera.dart';
import 'package:soundgrade/utils/theme_notifier.dart';



class ProfileTemporaryPage extends StatelessWidget {
  const ProfileTemporaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(),
      actions: [
        SignedOutAction((context) {
          Navigator.of(context).pop();
        })
      ],
      
    );
  }
}
