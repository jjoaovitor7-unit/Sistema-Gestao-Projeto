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

  AbaProjeto({this.projectModel});

  @override
  _AbaProjetoState createState() => _AbaProjetoState();
}

class _AbaProjetoState extends State<AbaProjeto> {
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
        child: DetalheProjetoGestro(
          titleText: "Gestro",
          // this.widget.projectModel.name,
          descText:
              "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensure; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases",
          pesquisador: "Dr. Fabio Gomes Rocha",
          dataInicio: new DateTime.utc(2020, 08, 10),
          dataTermino: new DateTime.utc(2020, 09, 15),
        ),
      ),
    );
  }
}
