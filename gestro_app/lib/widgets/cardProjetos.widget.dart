import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:gestro_app/globals.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/pages/detalheProjeto.page.dart';
import 'package:gestro_app/pages/projetos.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:intl/intl.dart';

class CardProjeto extends StatefulWidget {
  Widget onTap;
  bool status;
  int index;

  ProjectModel projectModel;
  dynamic nomeProjeto = TextEditingController();
  dynamic descProjeto = TextEditingController();
  dynamic pesquisadorProjeto = TextEditingController();
  dynamic dataInicioProjeto = TextEditingController();
  dynamic dataTerminoProjeto = TextEditingController();

  final format = DateFormat("yyyy-MM-dd HH:mm");

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
        projectModelGlobal = this.widget.projectModel;

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
                          if (value == 'Editar') {
                            showDialog(
                              context: context,
                              child: Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.52,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: 'Nome do Projeto'),
                                        controller: this.widget.nomeProjeto,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: 'Descrição'),
                                        controller: this.widget.descProjeto,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: 'Pesquisador'),
                                        controller:
                                            this.widget.pesquisadorProjeto,
                                      ),
                                      DateTimeField(
                                          decoration: InputDecoration(
                                            hintText: "Data de Início",
                                            hintStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.032,
                                              color: Colors.black,
                                            ),
                                          ),
                                          format: this.widget.format,
                                          onShowPicker:
                                              (context, currentValue) {
                                            return showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1900),
                                              initialDate: currentValue ??
                                                  DateTime.now(),
                                              lastDate: DateTime(2100),
                                            ).then((pickedDate) {
                                              this.widget.dataInicioProjeto =
                                                  pickedDate;
                                              return this
                                                  .widget
                                                  .dataInicioProjeto;
                                            });
                                          }),
                                      DateTimeField(
                                          decoration: InputDecoration(
                                            hintText: "Data de Início",
                                            hintStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.032,
                                              color: Colors.black,
                                            ),
                                          ),
                                          format: this.widget.format,
                                          onShowPicker:
                                              (context, currentValue) {
                                            return showDatePicker(
                                              context: context,
                                              firstDate: DateTime(1900),
                                              initialDate: currentValue ??
                                                  DateTime.now(),
                                              lastDate: DateTime(2100),
                                            ).then((pickedDate) {
                                              this.widget.dataTerminoProjeto =
                                                  pickedDate;
                                              return this
                                                  .widget
                                                  .dataTerminoProjeto;
                                            });
                                          }),
                                      FlatButton(
                                          child: Text("Editar"),
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection("Projects")
                                                .doc(this
                                                    .widget
                                                    .projectModel
                                                    .idProject
                                                    .id)
                                                .update({
                                              "name":
                                                  this.widget.nomeProjeto.text,
                                              "description":
                                                  this.widget.descProjeto.text,
                                              "pesquisador": this
                                                  .widget
                                                  .pesquisadorProjeto
                                                  .text,
                                              "startedAt":
                                                  this.widget.dataInicioProjeto,
                                              "endedAt":
                                                  this.widget.dataTerminoProjeto
                                            });
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProjetosPage(),
                                                ));
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
                                    .collection('Projects');

                            collectionReference1
                                .doc(this.widget.projectModel.idProject.id +
                                    "/Alunos")
                                .get()
                                .then((doc) {
                              if (doc.exists) {
                                collectionReference1
                                    .doc(this.widget.projectModel.idProject.id +
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
                                    .doc(this.widget.projectModel.idProject.id +
                                        "/Tasks")
                                    .delete();
                              }
                            });

                            collectionReference1
                                .doc(this.widget.projectModel.idProject.id)
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
