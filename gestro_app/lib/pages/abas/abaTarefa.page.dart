import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/models/task_model.dart';
import 'package:gestro_app/pages/novaTarefa.page.dart';
import 'package:gestro_app/pages/novoAluno.page.dart';
import 'package:gestro_app/pages/selecionarAluno.page.dart';
import 'package:gestro_app/widgets/bottomNavigation.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardTarefas.widget.dart';
import 'package:gestro_app/models/project.model.dart';

class AbaTarefa extends StatefulWidget {
  final ProjectModel projectModel;
  AbaTarefa({
    @required this.projectModel,
  });
  @override
  _AbaTarefaState createState() => _AbaTarefaState();
}

class _AbaTarefaState extends State<AbaTarefa> {
  int _value = 1;

  List<TaskModel> tarefas;

  @override
  void initState() {
    super.initState();
    tarefas = [];
    widget.projectModel.idProject.collection('Tasks').get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        var t = List<TaskModel>.from(snapshot.docs.map((element) {
          return TaskModel.fromJson(element.data(), element.reference);
        }));
        setState(() {
          tarefas = t;
        });
      }
    });
  }

  @override
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
                builder: (context) =>
                    NovaTarefaPage(projeto: this.widget.projectModel),
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
                builder: (context) => NovoAlunoPage(
                  projectModel: this.widget.projectModel,
                ),
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
                "assets/BkTask.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              // color: Colors.red,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 25, left: 20),
              // padding: EdgeInsets.only(right: 10),
              height: MediaQuery.of(context).size.height * 0.13,
              // width: MediaQuery.of(context).size.width * 0.9,
              child: ListView(
                scrollDirection: Axis.horizontal,

                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
              // padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              margin: EdgeInsets.only(top: 5),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    dropdownColor: purpleSecudary,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    isExpanded: true,
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Text(
                            "Concluídas",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Text(
                            "Atrasadas",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: Text(
                            "Em Andamento",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        value: 3,
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
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return CardTarefa(
                    textStatus: "Concluída",
                    status: true,
                    model: tarefas[index],
                    projectModel: this.widget.projectModel,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
