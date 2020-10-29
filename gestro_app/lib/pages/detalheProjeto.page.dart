import 'package:flutter/material.dart';
import 'package:gestro_app/pages/bottomNavigation.dart';
import 'package:gestro_app/pages/projetos.page.dart';
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
        // body: _pages[_currentIndex],
        // body: Stack(
        //   children: [
        //     [
        //       DetalheProjeto(),
        //     ][_currentIndex]
        //   ],
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.white,
        //   unselectedItemColor: Colors.grey,
        //   selectedItemColor: purpleSecudary,
        //   type: BottomNavigationBarType.fixed,
        //   onTap: onTabTapped,
        //   currentIndex: _currentIndex,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         FontAwesome5.house_user,
        //       ),
        //       label: "Home",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         FontAwesome5.clipboard_check,
        //         // color: index == 1 ? purpleSecudary : Colors.grey,
        //       ),
        //       label: "Aprovações",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         FontAwesome5.list,
        //       ),
        //       label: "Tarefas",
        //       backgroundColor: Colors.amber,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         FontAwesome5.users,
        //       ),
        //       label: "Alunos",
        //       backgroundColor: Colors.amber,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         FontAwesome5.user,
        //       ),
        //       label: "Perfil",
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
