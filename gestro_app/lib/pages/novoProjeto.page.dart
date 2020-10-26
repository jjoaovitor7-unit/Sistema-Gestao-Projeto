import 'package:flutter/material.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/buttonGestro.widget.dart';
import 'package:gestro_app/widgets/containerGestro.widget.dart';
import 'package:gestro_app/widgets/containerGestroGrande.widget.dart';

class NovoProjetoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGestro(
        title: "Projetos",
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/BkLampada.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3,
                bottom: MediaQuery.of(context).size.height * 0.19,
              ),
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 35),
                children: [
                  Center(
                    child: Text(
                      "Novo projeto",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ContainerGestro(text: "Nome", icon: null),
                  ContainerGestroGrande(text: "Descrição", icon: null),
                  ContainerGestro(text: "Data de início", icon: null),
                  ContainerGestro(text: "Data de Término", icon: null),
                  ButtonGestro(text: "Salvar"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
