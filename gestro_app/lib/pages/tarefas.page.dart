import 'package:flutter/material.dart';
import 'package:gestro_app/pages/bottomNavigation.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardTarefa2.widget.dart';
import 'package:gestro_app/widgets/cardTarefas.widget.dart';

class TarefaPage extends StatefulWidget {
  @override
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBarGestro(
        title: "Tarefas",
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/BkTask.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CardTarefa2(
                    textStatus: "Executando",
                    status: false,
                  ),
                  CardTarefa2(
                    textStatus: "Executando",
                    status: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
