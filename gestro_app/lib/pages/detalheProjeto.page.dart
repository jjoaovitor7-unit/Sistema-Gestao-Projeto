import 'package:flutter/material.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/pages/abas/abaAlunos.page.dart';
import 'package:gestro_app/pages/abas/abaProjeto.page.dart';
import 'package:gestro_app/pages/abas/abaTarefa.page.dart';
import 'package:gestro_app/widgets/bottomNavigation.dart';
import 'package:gestro_app/pages/projetos.page.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'aprovacoes.page.dart';

class DetalheProjeto extends StatefulWidget {
  int index;
  ProjectModel projectModel;

  DetalheProjeto({this.index, this.projectModel});

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
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
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
              child: AbaProjeto(
                index: widget.index,
                projectModel: this.widget.projectModel,
              ),
            ),
            Container(
              child: AbaTarefa(
                projectModel: this.widget.projectModel,
              ),
            ),
            Container(
              child: AbaAluno(
                  // projectModel: this.widget.projectModel,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
