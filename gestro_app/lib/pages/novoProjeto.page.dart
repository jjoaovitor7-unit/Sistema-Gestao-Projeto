import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:gestro_app/globals.dart';
import 'package:gestro_app/pages/projetos.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/bottomNavigation.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/buttonGestro.widget.dart';
import 'package:gestro_app/widgets/inputGestro.widget.dart';
import 'package:gestro_app/widgets/inputGestroGrande.widget.dart';
import 'package:intl/intl.dart';

class NovoProjetoPage extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;

  dynamic myControllerNomeProjeto = TextEditingController();
  dynamic myControllerDescProjeto = TextEditingController();
  dynamic myControllerdataInicio = TextEditingController();
  dynamic myControllerdataTermino = TextEditingController();

  final format = DateFormat("yyyy-MM-dd HH:mm");
  dynamic dataInicioProjeto;
  dynamic dataTerminoProjeto;

  void newProject() {
    firestoreInstance.collection("Projects").add({
      "name": myControllerNomeProjeto.text,
      "description": myControllerDescProjeto.text,
      "startedAt": dataInicioProjeto,
      "activationStatus": false,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigation(),
      appBar: AppBarGestro(
        title: "Projetos",
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        // padding: EdgeInsets.symmetric(horizontal: 35),
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
                bottom: MediaQuery.of(context).size.height * 0.1,
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
                  InputGestro(
                      text: "Nome",
                      icon: null,
                      myController: myControllerNomeProjeto),
                  InputGestroGrande(
                    text: "Descrição",
                    icon: null,
                    myController: myControllerDescProjeto,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: purplePrimary,
                    ),
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.only(left: 20, right: 10),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Column(
                      children: [
                        DateTimeField(
                            decoration: InputDecoration(
                              hintText: "Data de Início",
                              hintStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.032,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                            ),
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100),
                              ).then((pickedDate) {
                                dataInicioProjeto = pickedDate;
                                return dataInicioProjeto;
                              });
                            }),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: purplePrimary,
                    ),
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.only(left: 20, right: 10),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Column(children: [
                      DateTimeField(
                          decoration: InputDecoration(
                            hintText: "Data de Término",
                            hintStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.032,
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                          ),
                          format: format,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100),
                            ).then((pickedDate) {
                              dataTerminoProjeto = pickedDate;
                              return dataTerminoProjeto;
                            });
                          }),
                    ]),
                  ),
                  GestureDetector(
                    onTap: () => {
                      newProject(),
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjetosPage(),
                        ),
                      ),
                      Navigator.pop(context),
                      Navigator.pop(context),
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjetosPage(),
                        ),
                      ),
                    },
                    child: ButtonGestro(text: "Salvar"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
