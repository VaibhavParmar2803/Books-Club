import 'package:book_app/src/page/home/home.dart';
import 'package:book_app/src/page/home/widget/fav_book.dart';
import 'package:book_app/src/profile/profile.dart';
import 'package:book_app/src/settings/settings_controller.dart';
import 'package:book_app/src/theme/Book/BookScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class ColumnScreen extends StatefulWidget {
  SettingsController settingsController;

  ColumnScreen({Key? key, required this.settingsController}) : super(key: key);

  @override
  State<ColumnScreen> createState() => _HomePageState();
}

class _HomePageState extends State<ColumnScreen> {
  int currIndx = 2;

  List pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [FavBook()],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xFF6741FF),
      currentIndex: currIndx,
      onTap: (index) {
        if (index == 0) {
          // If "Person" icon is tapped (index 3), navigate to the Profile screen.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                settingsController: widget.settingsController,
              ), // Replace with your Profile screen/widget.
            ),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookScreen(
                settingsController: widget.settingsController,
              ), // Replace with your Profile screen/widget.
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(
                settingsController: widget.settingsController,
              ), // Replace with your Profile screen/widget.
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
        )
      ],
    );
  }
}
