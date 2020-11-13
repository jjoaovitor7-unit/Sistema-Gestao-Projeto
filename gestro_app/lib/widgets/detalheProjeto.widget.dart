import 'package:flutter/material.dart';

class DetalheProjetoGestro extends StatelessWidget {
  String titleText;
  String descText;
  String pesquisador;
  DateTime dataInicio;
  DateTime dataTermino;

  DetalheProjetoGestro(
      {@required this.titleText,
      @required this.descText,
      @required this.pesquisador,
      @required this.dataInicio,
      @required this.dataTermino});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.25,
          ),
          child: Container(
            alignment: Alignment(0.0, 0.0),
            child: Text(
              this.titleText,
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 35, right: 35, bottom: 20),
          child: Text(
            this.descText,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.024,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Pesquisador: ",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.pesquisador,
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Data de Início: ",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.dataInicio.day.toString() +
                        "/" +
                        this.dataInicio.month.toString() +
                        "/" +
                        this.dataInicio.year.toString(),
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "Data de Término: ",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      this.dataTermino.day.toString() +
                          "/" +
                          this.dataTermino.month.toString() +
                          "/" +
                          this.dataTermino.year.toString(),
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
