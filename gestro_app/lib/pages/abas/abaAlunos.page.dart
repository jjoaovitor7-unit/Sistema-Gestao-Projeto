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
import 'package:gestro_app/extensions/sigla.dart';

class AbaAluno extends StatefulWidget {
  ProjectModel projectModel;

  AbaAluno({@required this.projectModel});

  @override
  _AbaAlunoState createState() => _AbaAlunoState();
}

class _AbaAlunoState extends State<AbaAluno> {
  int countdocs = 0;

  Future<int> countDocuments() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection('Projects/' + widget.projectModel.idProject.id + '/Alunos').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    return _myDocCount.length;
  }

  List<UserModel> listUser;

  dynamic nomeAluno = TextEditingController();
  dynamic emailAluno = TextEditingController();
  dynamic senhaAluno = TextEditingController();

  @override
  void initState() {
    super.initState();
    listUser = [];
    this.widget.projectModel.idProject.collection('Alunos').get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          DocumentReference documentReference = element.data()['referencia_aluno'];
          documentReference.get().then((document) {
            setState(() {
              listUser.add(
                UserModel.fromJson(document.data(), document.reference),
              );
            });
          });
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
                            initialsText: Text((listUser[index].name.toSiglas),
                                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.purple)),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  listUser[index].name,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, top: 25),
                                child: Text(listUser[index].email, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
                              ),
                              Container(
                                // color: Colors.blue,
                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.64),
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
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        value: 'Excluir'),
                                  ],
                                  onSelected: (value) {
                                    if (value == 'Editar') {
                                      showDialog(
                                        context: context,
                                        child: Dialog(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * 0.32,
                                            child: Column(
                                              children: <Widget>[
                                                TextFormField(
                                                  decoration: const InputDecoration(hintText: 'Nome do Aluno'),
                                                  controller: this.nomeAluno,
                                                ),
                                                TextFormField(
                                                  decoration: const InputDecoration(hintText: 'E-mail'),
                                                  controller: this.emailAluno,
                                                ),
                                                TextFormField(
                                                  decoration: const InputDecoration(hintText: 'Senha'),
                                                  controller: this.senhaAluno,
                                                ),
                                                FlatButton(
                                                    child: Text("Editar"),
                                                    onPressed: () {
                                                      CollectionReference collectionReference1 = FirebaseFirestore.instance.collection('Users');

                                                      collectionReference1.doc(this.listUser[index].idUser.id).update({
                                                        "name": this.nomeAluno.text,
                                                        "email": this.emailAluno.text,
                                                        "password": this.senhaAluno.text,
                                                      });
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    if (value == 'Excluir') {
                                      CollectionReference collectionReference1 = FirebaseFirestore.instance.collection('Projects');

                                      Future<QuerySnapshot> test = collectionReference1
                                          .doc(this.widget.projectModel.idProject.id)
                                          .collection("Alunos")
                                          .where("referencia_aluno",
                                              isEqualTo: FirebaseFirestore.instance.collection("Users").doc(this.listUser[index].idUser.id))
                                          .get();
                                      test.then((value) => value.docs.forEach((element) async {
                                            collectionReference1
                                                .doc(this.widget.projectModel.idProject.id)
                                                .collection("Alunos")
                                                .doc(element.id)
                                                .delete();
                                          }));
                                    }
                                  },
                                ),
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
