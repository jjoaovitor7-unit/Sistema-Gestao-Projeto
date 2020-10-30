import 'package:flutter/material.dart';
import 'package:gestro_app/pages/bottomNavigation.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardTarefas.widget.dart';

class AbaTarefa extends StatefulWidget {
  @override
  _AbaTarefaState createState() => _AbaTarefaState();
}

class _AbaTarefaState extends State<AbaTarefa> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigation(),
      // appBar: AppBarGestro(
      //   title: "Tarefas",
      // ),
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
            Container(
              margin: EdgeInsets.only(top: 25, left: 10),
              height: MediaQuery.of(context).size.height * 0.11,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          "10",
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                        Text("Concluídas",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          "09",
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                        Text("Criadas", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          "05",
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                        Text("Executando",
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          "05",
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                        Text("Atrasadas", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              margin: EdgeInsets.only(top: 5),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    isExpanded: true,
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "concluída",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: 1,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    }),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CardTarefa(
                    textStatus: "Concluída",
                    status: true,
                  ),
                  CardTarefa(
                    textStatus: "Criada",
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
