import 'package:flutter/material.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/button2Gestro.widget.dart';
import 'package:gestro_app/widgets/buttonGestro.widget.dart';
import 'package:gestro_app/widgets/smallButton2Gestro.widget.dart';
import 'package:gestro_app/widgets/smallButtonGestro.widget.dart';

class CardAprocao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.532,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Aplicativo de vendas",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      "Pesquisador: ",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Dr. Fábio Gomes Rocha",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Text(
                  "App que funciona como um classificados de anúncios."
                  "Ele já foi baixado por mais de 5 milhões de usuários, mas as suas vantagens vão além da sua popularidade."
                  "O aplicativo possui um visual limpo e que lembra algumas redes sociais mais visuais."
                  "O público pode curtir as ofertas publicadas, conversar e negociar com os vendedores e "
                  "finalizar a compra no próprio app (via cartão de crédito)."
                  "Mas o que chama a atenção mesmo, por enquanto, é o frete gratuito",
                  style: TextStyle(
                    color: grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Row(
                  children: [
                    Text(
                      "Data de Início: ",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "10/11/2020",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Data de Térmno: ",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "10/12/2020",
                      style: TextStyle(
                        color: purpleSecudary,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmallButton2Gestro(
                      text: "Rejeitar",
                      onTap: null,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.013,
                    ),
                    SmallButtonGestro(
                      text: "Aprovar",
                      onTap: null,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
