import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:gestro_app/pages/abaProjeto.page.dart';
import 'package:gestro_app/pages/abaTarefa.page.dart';
import 'package:gestro_app/pages/bottomNavigation.dart';
import 'package:gestro_app/pages/novaTarefa.page.dart';
import 'package:gestro_app/pages/novoProjeto.page.dart';
import 'package:gestro_app/pages/projetos.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'aprovacoes.page.dart';

class DetalheProjeto extends StatefulWidget {
  @override
  _DetalheProjetoState createState() => _DetalheProjetoState();
}

class _DetalheProjetoState extends State<DetalheProjeto> {
  final List<Widget> _pages = [
    ProjetosPage(),
    AprovacoesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomNavigation(),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
          child: AppBarGestro(
            title: "Projeto",
            tabBar: true,
            isThree: true,
            tabBar1: Tab(
              child: Text(
                'Projetos',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            tabBar2: Tab(
              child: Text(
                'Tarefas',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            tabBar3: Tab(
              child: Text(
                'Alunos',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/BkDetalheProjeto.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
              child: AbaProjeto(),
            ),
            Container(
              child: AbaTarefa(),
            ),
            Container(),
          ],
        ),
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
                  builder: (context) => NovaTarefaPage(),
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
                  builder: (context) => NovaTarefaPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
