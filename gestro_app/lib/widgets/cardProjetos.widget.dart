import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/pages/detalheProjeto.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class CardProjeto extends StatefulWidget {
  Widget onTap;
  bool status;
  int index;

  ProjectModel projectModel;

  CardProjeto(
      {this.onTap, this.status, @required this.projectModel, this.index});

  @override
  _CardProjetoState createState() => _CardProjetoState();
}

class _CardProjetoState extends State<CardProjeto> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalheProjeto(
              projectModel: this.widget.projectModel,
              index: this.widget.index,
            ),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.015,
          left: MediaQuery.of(context).size.height * 0.024,
          right: MediaQuery.of(context).size.height * 0.024,
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0,
                left: MediaQuery.of(context).size.height * 0.024,
                right: MediaQuery.of(context).size.height * 0.024,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // "Aplicativo de vendas",
                        this.widget.projectModel.name,
                        style: TextStyle(
                          color: purpleSecudary,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PopupMenuButton(
                        onSelected: (value) {
                          if (value == 'Excluir') {
                            CollectionReference collectionReference1 =
                                FirebaseFirestore.instance
                                    .collection('Projects');

                            collectionReference1
                                .doc(this.widget.projectModel.idProject.id +
                                    "/Alunos")
                                .get()
                                .then((doc) {
                              if (doc.exists) {
                                collectionReference1
                                  ..doc(this.widget.projectModel.idProject.id +
                                          "/Alunos")
                                      .delete();
                              }
                            });

                            collectionReference1
                                .doc(this.widget.projectModel.idProject.id +
                                    "/Tasks")
                                .get()
                                .then((doc) {
                              if (doc.exists) {
                                collectionReference1
                                  ..doc(this.widget.projectModel.idProject.id +
                                          "/Tasks")
                                      .delete();
                              }
                            });

                            collectionReference1
                              ..doc(this.widget.projectModel.idProject.id)
                                  .delete();
                          }
                        },
                        // key: _menuKey,
                        color: purpleSecudary,
                        icon: Icon(
                          Icons.more_vert,
                          color: purpleSecudary,
                        ),
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
                            value: 'Excluir',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        this.widget.projectModel.activationStatus == null
                            ? "Projeto Aguardando Aprovação"
                            : this.widget.projectModel.activationStatus == true
                                ? "Projeto em execução"
                                : "Projeto rejeitado",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    // color: Colors.grey[900],
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: purpleSecudary,
                  checkColor: Colors.white,
                  value: this.widget.status,
                  autofocus: true,
                  onChanged: (bool value) {
                    setState((() {
                      this.widget.status = value;
                    }));
                  },
                ),
                Text("0/0"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
