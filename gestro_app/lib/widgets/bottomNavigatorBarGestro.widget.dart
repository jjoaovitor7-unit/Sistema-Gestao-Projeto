import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class BottomNavigatorBarGestro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: purpleSecudary,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.house_user,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.clipboard_check,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.list,
          ),
          label: "",
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.users,
          ),
          label: "",
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.user,
          ),
          label: "",
        ),
      ],
    );
  }
}
