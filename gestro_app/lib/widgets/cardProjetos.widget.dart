import 'package:flutter/material.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class CardProjeto extends StatefulWidget {
  Widget onTap;
  bool status;

  ProjectModel projectModel;

  CardProjeto({
    this.onTap,
    this.status,
    this.projectModel,
  });

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
            builder: (context) => this.widget.onTap,
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
                                    value: 'Excluir'),
                              ],
                          onSelected: (_) {}),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Projeto de Rejeitado",
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
