import 'package:flutter/material.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/smallButtonGestro.widget.dart';

class CardTarefa2 extends StatefulWidget {
  String textStatus;
  bool status;
  IconData icon;
  // Container container;

  CardTarefa2({@required this.textStatus, this.status = false, this.icon});

  @override
  _CardTarefa2State createState() => _CardTarefa2State();
}

class _CardTarefa2State extends State<CardTarefa2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.025,
        left: MediaQuery.of(context).size.height * 0.025,
        right: MediaQuery.of(context).size.height * 0.025,
      ),
      color: Colors.white,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, bottom: 5),
                    child: Text(
                      "Aplicativo de vendas",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      "Criação da tela de cadastro",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 20),
                child: Row(
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
                      "10/08/2020",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Text(
              "On the other hand, we denounce with righteous indignation and dislike men who are so beguiledand demoralized by the.",
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
                        if (this.widget.status == true) {
                          widget.textStatus = "Concluída";
                        } else {
                          widget.textStatus = "Executando";
                        }
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
          // widget.container,
        ],
      ),
    );
  }
}
