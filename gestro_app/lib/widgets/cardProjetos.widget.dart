import 'package:flutter/material.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class CardProjeto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      "Aplicativo de vendas",
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
                value: true,
                autofocus: true,
                onChanged: (bool value) {
                  value = true;
                },
              ),
              Text("0/0"),
            ],
          ),
        ],
      ),
    );
  }
}
