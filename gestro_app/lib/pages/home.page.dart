import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projetos"),
        centerTitle: true,
        backgroundColor: purpleSecudary,
        actions: [
          Icon(
            FontAwesome.bell_alt,
            size: MediaQuery.of(context).size.height * 0.028,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              purpleSecudary,
              purplePrimary,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 300,
              color: Colors.white,
              child: Column(
                children: [
                  Text("Aplicativo de vendas"),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
