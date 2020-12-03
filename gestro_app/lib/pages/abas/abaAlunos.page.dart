import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/models/user_model.dart';
import 'package:gestro_app/pages/novaTarefa.page.dart';
import 'package:gestro_app/pages/novoAluno.page.dart';
import 'package:gestro_app/pages/selecionarAluno.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class AbaAluno extends StatefulWidget {
  ProjectModel projectModel;

  AbaAluno({@required this.projectModel});

  @override
  _AbaAlunoState createState() => _AbaAlunoState();
}

class _AbaAlunoState extends State<AbaAluno> {
  int countdocs = 0;

  Future<int> countDocuments() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection('Projects/' + widget.projectModel.idProject.id + '/Alunos')
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    return _myDocCount.length;
  }

  List<UserModel> listUser;

  @override
  void initState() {
    super.initState();
    listUser = [];
    this.widget.projectModel.idProject.collection('Alunos').get().then((value) {
      if (value.docs.isNotEmpty) {
        setState(() {
          listUser = List<UserModel>.from(
              value.docs.map((e) => UserModel.fromJson(e.data(), e.reference)));
        });
      }
    });
  }

  Widget build(BuildContext context) {
    countDocuments().then((value) {
      setState(() {
        countdocs = value;
      });
    });
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
                builder: (context) => NovaTarefaPage(
                  projeto: this.widget.projectModel,
                ),
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
                  projectModel: widget.projectModel,
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
                "assets/BkAlunos.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 30,
            // left: 30,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listUser.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                  listUser[index].name,
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
                                // color: Colors.blue,
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.64),
                                child: PopupMenuButton(
                                    // key: _menuKey,
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                    color: purpleSecudary,
                                    itemBuilder: (_) => <PopupMenuItem<String>>[
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
