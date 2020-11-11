import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/widgets/bottomNavigation.dart';
import 'package:gestro_app/pages/detalheProjeto.page.dart';
import 'package:gestro_app/pages/novoProjeto.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardProjetos.widget.dart';

class ProjetosPage extends StatelessWidget {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('Projects');

  Future<QuerySnapshot> getData() {
    final Completer<QuerySnapshot> c = new Completer();
    collectionReference.snapshots().listen((data) {
      c.complete(Future.value(data));
    });
    return c.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBarGestro(
        title: "Projetos",
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradientGestro,
        ),
        child: FutureBuilder<QuerySnapshot>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardProjeto(
                        onTap: DetalheProjeto(),
                        status: true,
                        projectModel: ProjectModel.fromJson(snapshot.data.docs[index].data()),
                      );
                    },
                  )
                : CircularProgressIndicator();
          },
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

List<Future<ProjectModel>> getProjects() {}
