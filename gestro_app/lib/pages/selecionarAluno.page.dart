import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/pages/bottomNavigation.dart';
import 'package:gestro_app/pages/novaTarefa.page.dart';
import 'package:gestro_app/pages/novoAluno.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';

class SelecionarAlunoPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBarGestro(
        title: "Selecionar Aluno",
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 35,
                margin: EdgeInsets.only(bottom: 35, right: 30),
                child: Container(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        primaryColor: Colors.white,
                        accentColor: Colors.white,
                        brightness: Brightness.light),
                    child: TextFormField(
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Procurar",
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(FontAwesome5.search),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
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
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Lucas Calheiros dos Santos",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 25),
                                  child: Text("lucascalheiros@souunit.com.br",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 250),
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
                                                child: Text(
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
                        padding: EdgeInsets.only(top: 10, bottom: 10),
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
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Artur Delgado",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 25),
                                  child: Text("arturdelgado@souunit.com.br",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 250),
                                  child: PopupMenuButton(
                                      // key: _menuKey,
                                      color: purpleSecudary,
                                      itemBuilder: (_) =>
                                          <PopupMenuItem<String>>[
                                            new PopupMenuItem<String>(
                                                child: Text(
                                                  'Editar',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  // textAlign: TextAlign.center,
                                                ),
                                                value: 'Editar'),
                                            new PopupMenuItem<String>(
                                                child: Text(
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
