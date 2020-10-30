import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/pages/novaTarefa.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class AbaAluno extends StatelessWidget {
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/BkAlunos.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 30, left: 30),
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            CircularProfileAvatar(
                              '',
                              radius: 35,
                              backgroundColor: Colors.purple[200],
                              initialsText: Text("LC",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple)),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Lucas Calheiros dos Santos",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 25),
                                  child: Text("lucascalheiros@souunit.com.br",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white)),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 250),
                                  child: PopupMenuButton(
                                      // key: _menuKey,
                                      color: purpleSecudary,
                                      itemBuilder: (_) =>
                                          <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: const Text(
                                                  'Editar',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  // textAlign: TextAlign.center,
                                                ),
                                                value: 'Editar'),
                                            new PopupMenuItem<String>(
                                                child: const Text(
                                                  'Excluir',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                value: 'Excluir'),
                                          ],
                                      onSelected: (_) {}),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 300, child: Divider(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            CircularProfileAvatar(
                              '',
                              radius: 35,
                              backgroundColor: Colors.purple[200],
                              initialsText: Text("AD",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple)),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Artur Delgado",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 25),
                                  child: Text("arturdelgado@souunit.com.br",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white)),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 250),
                                  child: PopupMenuButton(
                                      // key: _menuKey,
                                      color: purpleSecudary,
                                      itemBuilder: (_) =>
                                          <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: const Text(
                                                  'Editar',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  // textAlign: TextAlign.center,
                                                ),
                                                value: 'Editar'),
                                            new PopupMenuItem<String>(
                                                child: const Text(
                                                  'Excluir',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                value: 'Excluir'),
                                          ],
                                      onSelected: (_) {}),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 300, child: Divider(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: [
                            CircularProfileAvatar(
                              '',
                              radius: 35,
                              backgroundColor: Colors.purple[200],
                              initialsText: Text("AD",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple)),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Crislaine Santos de Macêdo",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 25),
                                  child: Text(
                                    "arturdelgado@souunit.com.br",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 250),
                                  child: PopupMenuButton(
                                      // key: _menuKey,
                                      color: purpleSecudary,
                                      itemBuilder: (_) =>
                                          <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: const Text(
                                                  'Editar',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  // textAlign: TextAlign.center,
                                                ),
                                                value: 'Editar'),
                                            new PopupMenuItem<String>(
                                                child: const Text(
                                                  'Excluir',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                value: 'Excluir'),
                                          ],
                                      onSelected: (_) {}),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 300, child: Divider(color: Colors.white)),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
