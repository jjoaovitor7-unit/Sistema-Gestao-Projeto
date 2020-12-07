import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/models/task_model.dart';
import 'package:gestro_app/pages/tarefas.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/smallButtonGestro.widget.dart';
import 'package:intl/intl.dart';

class CardTarefa extends StatefulWidget {
  String textStatus;
  bool status;
  IconData icon;
  TaskModel model;
  ProjectModel projectModel;

  CardTarefa(
      {@required this.textStatus,
      this.status = false,
      this.icon,
      @required this.model,
      @required this.projectModel});

  @override
  _CardTarefaState createState() => _CardTarefaState();
}

class _CardTarefaState extends State<CardTarefa> {
  final format = DateFormat("yyyy-MM-dd HH:mm");

  dynamic nomeTarefa = TextEditingController();
  dynamic descTarefa = TextEditingController();
  dynamic dataPrazoTarefa;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.025,
        left: MediaQuery.of(context).size.height * 0.025,
        right: MediaQuery.of(context).size.height * 0.025,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.0,
              left: MediaQuery.of(context).size.height * 0.025,
              right: MediaQuery.of(context).size.height * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.model.name,
                      style: TextStyle(
                        color: purpleSecudary,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: PopupMenuButton(
                        onSelected: (value) {
                          if (value == 'Excluir') {
                            CollectionReference collectionReference1 =
                                FirebaseFirestore.instance.collection(
                                    'Projects/' +
                                        this.widget.projectModel.idProject.id +
                                        "/Tasks");

                            collectionReference1
                                .doc(this.widget.model.projectId.id)
                                .delete();
                          }

                          if (value == 'Editar') {
                            CollectionReference collectionReference1 =
                                FirebaseFirestore.instance.collection(
                                    'Projects/' +
                                        this.widget.projectModel.idProject.id +
                                        "/Tasks");

                            showDialog(
                              context: context,
                              child: Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                  child: Column(children: <Widget>[
                                    TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: 'Nome da Tarefa'),
                                      controller: this.nomeTarefa,
                                    ),
                                    DateTimeField(
                                        decoration: InputDecoration(
                                          hintText: "Prazo",
                                          hintStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.032,
                                            color: Colors.black,
                                          ),
                                        ),
                                        format: this.format,
                                        onShowPicker: (context, currentValue) {
                                          return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate:
                                                currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100),
                                          ).then((pickedDate) {
                                            this.dataPrazoTarefa = pickedDate;
                                            return this.dataPrazoTarefa;
                                          });
                                        }),
                                    TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Descrição da Tarefa'),
                                        controller: this.descTarefa),
                                    FlatButton(
                                        child: Text("Editar"),
                                        onPressed: () {
                                          collectionReference1
                                              .doc(this
                                                  .widget
                                                  .model
                                                  .projectId
                                                  .id)
                                              .update({
                                            "name": this.nomeTarefa.text,
                                            "deadline": this.dataPrazoTarefa,
                                            "description": this.descTarefa.text,
                                          });
                                        })
                                  ]),
                                ),
                              ),
                            );
                          }
                        },
                        // key: _menuKey,
                        icon: Icon(
                          Icons.more_vert,
                          color: purpleSecudary,
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
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Prazo: ",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "this.widget.model.deadline",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              this.widget.model.description,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025),
              softWrap: true,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Divider(color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                  Text(this.widget.textStatus),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child: SmallButtonGestro(
                  text: "LC",
                  icon: this.widget.icon,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
