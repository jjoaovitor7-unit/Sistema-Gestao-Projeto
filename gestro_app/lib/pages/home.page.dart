import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

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
              Colors.purpleAccent,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      // top: 12,
                      // left: 15,
                      // right: 15,
                      top: MediaQuery.of(context).size.height * 0.022,
                      left: MediaQuery.of(context).size.height * 0.024,
                      right: MediaQuery.of(context).size.height * 0.024,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aplicativo de vendas",
                          style: TextStyle(
                            color: purpleSecudary,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Projeto de Rejeitado",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.009,
                        ),
                        Divider(
                          // color: Colors.grey[900],
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: purpleSecudary,
                        checkColor: Colors.white,
                        value: true,
                        autofocus: true,
                        onChanged: (bool value) {
                          value = true;
                        },
                      ),
                      Text("0/0"),
                    ],
                  ),
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
