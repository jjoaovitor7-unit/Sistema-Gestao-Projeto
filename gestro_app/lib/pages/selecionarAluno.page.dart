import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/pages/bottomNavigation.dart';
import 'package:gestro_app/pages/novaTarefa.page.dart';
import 'package:gestro_app/pages/novoAluno.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardAlunoGestro.widget.dart';

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
          padding: EdgeInsets.only(
            top: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 35,
                margin: EdgeInsets.only(
                  bottom: 35,
                  right: 30,
                  left: 33,
                ),
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Container(
                  child: Theme(
                    data: Theme.of(context).copyWith(primaryColor: Colors.white, accentColor: Colors.white, brightness: Brightness.light),
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
                      CardAlunoGestro(
                        name: "Lucas Calheiros dos Santos",
                        email: "lucascalheiros@souunit.com.br",
                        popMenu: false,
                        initials: "LC",
                      ),
                      // Container(width: 300, child: Divider(color: Colors.white)),
                      // CardAlunoGestro(
                      //   name: "Artur Delgado",
                      //   email: "arturdelgado@souunit.com.br",
                      //   popMenu: false,
                      //   initials: "AD",
                      // ),
                      Container(width: 300, child: Divider(color: Colors.white)),
                      CardAlunoGestro(
                        name: "Crislaine Santos de Macêdo",
                        email: "arturdelgado@souunit.com.br",
                        popMenu: false,
                        initials: "CM",
                      ),
                      Container(width: 300, child: Divider(color: Colors.white)),
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
