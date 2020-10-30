import 'package:flutter/material.dart';

class AbaProjeto extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 180, left: 20),
            child: Text(
              "Aplicativo de vendas",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 35, right: 35, bottom: 20),
            child: Text(
              "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensure; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.024,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
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
                      "Dr. Fabio Gomes Rocha",
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
                      "10/08/2020",
                      style: TextStyle(color: Colors.purple, fontSize: 20),
                    )
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
                        "15/09/2020",
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
