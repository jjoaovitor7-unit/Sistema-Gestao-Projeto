import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/button2Gestro.widget.dart';
import 'package:gestro_app/widgets/buttonGestro.widget.dart';
import 'package:gestro_app/widgets/smallButton2Gestro.widget.dart';
import 'package:gestro_app/widgets/smallButtonGestro.widget.dart';

class CardPesquisador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
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
                      "Dr. Fábio Gomes Rocha",
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
                Text(
                  "fabiorocha@souunit.com.br",
                  style: TextStyle(
                    color: grey,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Button2Gestro(
                  text: "curriculum_vitai.doc",
                  onTap: null,
                  icon: Icon(
                    FontAwesome5.download,
                    color: purpleSecudary,
                    size: 18,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.023,
                ),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
