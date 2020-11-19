import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/pages/detalheProjeto.page.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/pages/novoAluno.page.dart';
import 'package:gestro_app/pages/selecionarAluno.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/detalheProjeto.widget.dart';

import '../novaTarefa.page.dart';

class AbaProjeto extends StatefulWidget {
  ProjectModel projectModel;
  int index;
  AbaProjeto({
    @required this.projectModel,
    this.index,
  });

  @override
  _AbaProjetoState createState() => _AbaProjetoState();
}

class _AbaProjetoState extends State<AbaProjeto> {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('Projects');

  Future<QuerySnapshot> getData() {
    final Completer<QuerySnapshot> c = new Completer();
    collectionReference.snapshots().listen((data) {
      c.complete(Future.value(data));
    });
    return c.future;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: purpleSecudary,
        closeManually: true,
        children: [
          SpeedDialChild(
            child: Icon(FontAwesome5.list),
            backgroundColor: purpleSecudary,
            label: 'Nova Tarefa',
            labelBackgroundColor: purpleSecudary,
            labelStyle: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NovaTarefaPage(),
              ),
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.person, size: 30),
            backgroundColor: purpleSecudary,
            label: 'Novo Aluno',
            labelBackgroundColor: purpleSecudary,
            labelStyle: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NovoAlunoPage(),
              ),
            ),
          ),
          SpeedDialChild(
            child: Icon(FontAwesome5.search),
            backgroundColor: purpleSecudary,
            label: 'Selecionar Aluno',
            labelBackgroundColor: purpleSecudary,
            labelStyle: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelecionarAlunoPage(),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/BkDetalheProjeto.jpg",
              ),
              fit: BoxFit.cover),
        ),
        // margin: EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return snapshot.hasData
                  ? DetalheProjetoGestro(
                      titleText: this.widget.projectModel.name,
                      // this.widget.projectModel.name,
                      descText: this.widget.projectModel.description,
                      pesquisador: "Nome Pesquisado",
                      dataInicio: this.widget.projectModel.startedAt,
                      // dataTermino: this.widget.projectModel.endDate,
                    )
                  : CircularProgressIndicator();
            }),
      ),
    );
  }
}
