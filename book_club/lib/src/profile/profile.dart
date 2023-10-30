import 'package:book_app/src/column/columnscreen.dart';
import 'package:book_app/src/page/home/home.dart';
import 'package:book_app/src/settings/settings_controller.dart';
import 'package:book_app/src/theme/Book/BookScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  SettingsController settingsController;

  Profile({Key? key, required this.settingsController}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    // ignore: unused_local_variable
    GoogleSignInAccount? googleUser = GoogleSignIn().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // User's profile photo
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user?.photoURL ?? ''),
            ),
            SizedBox(height: 20),
            // User's name
            Text(user?.displayName ?? ''),
            // User's email
            Text(user?.email ?? ''),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _signOut(context);
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    // Navigate to the login screen or another appropriate screen.
    // You can customize this based on your app's navigation structure.
  }

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xFF6741FF),
      currentIndex: 3,
      onTap: (index) {
        if (index == 0) {
          // If "Home" icon is tapped, navigate to the Home screen.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                settingsController: widget.settingsController,
              ),
            ),
          );
        } else if (index == 1) {
          // If "Book" icon is tapped, navigate to the Book screen.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookScreen(
                settingsController: widget.settingsController,
              ),
            ),
          );
        } else if (index == 2) {
          // If "Column" icon is tapped, navigate to the Column screen.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ColumnScreen(
                settingsController: widget.settingsController,
              ),
            ),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Book',
          icon: Icon(Icons.menu_book_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Column',
          icon: Icon(Icons.view_week_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Person',
          icon: Icon(Icons.person_outline),
        ),
      ],
    );
  }
}
