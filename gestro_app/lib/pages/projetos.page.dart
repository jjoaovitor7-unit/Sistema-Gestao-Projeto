import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:gestro_app/pages/novoProjeto.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardProjetos.widget.dart';

class ProjetosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGestro(
        title: "Projetos",
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradientGestro,
        ),
        child: ListView(
          children: [
            CardProjetos(),
            CardProjetos(),
            CardProjetos(),
            CardProjetos(),
            CardProjetos(),
            CardProjetos(),
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NovoProjetoPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
