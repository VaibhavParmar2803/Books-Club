import 'package:book_app/src/app.dart';
import 'package:book_app/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

// ignore: must_be_immutable
class AuthenticationScreen extends StatelessWidget {
  SettingsController settingsController;

  AuthenticationScreen({Key? key, required this.settingsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen();
          } else {
            return MyApp(settingsController: settingsController);
          }
        });
  }
}
