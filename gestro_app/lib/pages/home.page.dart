import 'dart:ui';
<<<<<<< Updated upstream
=======

import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
<<<<<<< Updated upstream

=======
import 'package:fluttericon/linecons_icons.dart';
>>>>>>> Stashed changes
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/bottomNavigatorBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardProjetos.widget.dart';

class HomePage extends StatelessWidget {
  final circularMenu = CircularMenu(items: [
    CircularMenuItem(
        icon: Icons.home,
        onTap: () {
          // callback
        }),
    CircularMenuItem(
        icon: Icons.search,
        onTap: () {
          //callback
        }),
    CircularMenuItem(
        icon: Icons.settings,
        onTap: () {
          //callback
        }),
    CircularMenuItem(
        icon: Icons.star,
        onTap: () {
          //callback
        }),
    CircularMenuItem(
        icon: Icons.pages,
        onTap: () {
          //callback
        }),
  ]);
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
        child: ListView(
          children: [
            SizedBox(height: 20),
<<<<<<< Updated upstream
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
=======
            CardProjetos(),
            SizedBox(height: 20),
            CardProjetos(),
            SizedBox(height: 20),
            CardProjetos(),
            SizedBox(height: 20),
            CardProjetos(),
            SizedBox(height: 20),
            CardProjetos(),
            SizedBox(height: 20),
            CardProjetos(),
>>>>>>> Stashed changes
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: purpleSecudary,
        closeManually: true,
        children: [
          SpeedDialChild(
              child: Icon(Linecons.lightbulb),
              backgroundColor: purpleSecudary,
              label: 'Novo Projeto',
              labelBackgroundColor: purpleSecudary,
              labelStyle: TextStyle(
                fontSize: 17.0,
                color: Colors.white,
              ),
              onTap: () => print('FIRST CHILD')),
        ],
      ),
      bottomNavigationBar: BottomNavigatorBarGestro(),
    );
  }
}
