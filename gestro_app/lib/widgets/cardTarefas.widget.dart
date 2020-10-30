import 'package:flutter/material.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class CardTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
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
                      "Criação da tela de cadastro",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PopupMenuButton(
                        // key: _menuKey,
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
                        onSelected: (_) {}),
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
                      "10/08/2020",
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
          Text(
            "On the other hand, we denounce with righteous indignation and dislike men who are so beguiledand demoralized by the.",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
            softWrap: true,
          ),
          Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                activeColor: purpleSecudary,
                checkColor: Colors.white,
                value: true,
                autofocus: true,
                onChanged: (bool value) {
                  value = true;
                },
              ),
              Text("Concluída"),
            ],
          ),
        ],
      ),
    );
  }
}
