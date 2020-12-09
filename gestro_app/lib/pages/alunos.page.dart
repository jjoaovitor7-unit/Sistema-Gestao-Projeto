import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/models/user_model.dart';
import 'package:gestro_app/widgets/bottomNavigation.dart';
import 'package:gestro_app/pages/novaTarefa.page.dart';
import 'package:gestro_app/pages/novoAluno.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardAlunoGestro.widget.dart';

class AlunosPage extends StatefulWidget {
  ProjectModel projectModel;

  AlunosPage({@required projectModel});

  @override
  _AlunosPageState createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  List<UserModel> listUser;

  @override
  String initialUser(String nomeCompleto) {
    List<String> nome = nomeCompleto.split(" ");
    return nome[0][0] + (nome.length > 1 ? nome[1][0] : "");
  }

  dynamic nomeAluno = TextEditingController();
  dynamic emailAluno = TextEditingController();
  dynamic senhaAluno = TextEditingController();

  void initState() {
    super.initState();
    listUser = [];
    FirebaseFirestore.instance
        .collection('Users')
        .where("type", isEqualTo: "Aluno")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          setState(() {
            listUser.add(
              UserModel.fromJson(element.data(), element.reference),
            );
          });
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: purpleSecudary,
          closeManually: true,
          children: [
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
          ]),
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBarGestro(
        title: "Alunos",
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
                height: 38,
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
                        contentPadding: EdgeInsets.only(top: 0, left: 15),
                      ),
                    ),
                  ),
                ),
              ),
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
                            initialsText: Text(
                                initialUser(listUser[index].name),
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
                                child: Text(listUser[index].email,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.32,
                                            child: Column(
                                              children: <Widget>[
                                                TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText:
                                                              'Nome do Aluno'),
                                                  controller: this.nomeAluno,
                                                ),
                                                TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText: 'E-mail'),
                                                  controller: this.emailAluno,
                                                ),
                                                TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          hintText: 'Senha'),
                                                  controller: this.senhaAluno,
                                                ),
                                                FlatButton(
                                                    child: Text("Editar"),
                                                    onPressed: () {
                                                      CollectionReference
                                                          collectionReference1 =
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Users');

                                                      collectionReference1
                                                          .doc(this
                                                              .listUser[index]
                                                              .idUser
                                                              .id)
                                                          .update({
                                                        "name":
                                                            this.nomeAluno.text,
                                                        "email": this
                                                            .emailAluno
                                                            .text,
                                                        "password": this
                                                            .senhaAluno
                                                            .text,
                                                      });
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    if (value == 'Excluir') {
                                      CollectionReference collectionReference1 =
                                          FirebaseFirestore.instance
                                              .collection('Users');

                                      collectionReference1
                                          .doc(this.listUser[index].idUser.id)
                                          .delete();
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
