import 'package:flutter/material.dart';
import 'package:gestro_app/pages/themes/globals.themes.dart';
import 'package:gestro_app/widgets/buttonGestro.widget.dart';
import 'package:gestro_app/widgets/containerGestro.widget.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom * 0.6;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/BkRegisterScreen.png"), fit: BoxFit.fitWidth),
            ),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height),
            child: ListView(
              // physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 35),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 245),
                  child: Center(
                    child: Text(
                      "Cadastro",
                      style: TextStyle(color: Colors.purple, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ContainerGestro(
                  text: "Nome",
                  icon: Icon(
                    Icons.person,
                    color: purpleSecudary,
                  ),
                ),
                ContainerGestro(
                  text: "Email",
                  icon: Icon(
                    Icons.mail,
                    color: purpleSecudary,
                  ),
                ),
                ContainerGestro(
                  text: "Senha",
                  passVisible: true,
                  icon: Icon(
                    Icons.lock,
                    color: purpleSecudary,
                  ),
                ),
                ContainerGestro(
                  text: "Confirme a senha",
                  passVisible: true,
                  icon: Icon(
                    Icons.lock,
                    color: purpleSecudary,
                  ),
                ),
                ButtonGestro(
                  text: 'Cadastrar',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        "Já possui cadastro?",
                        style: TextStyle(fontSize: 16, color: Colors.purple),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 5),
                      child: InkWell(
                        child: Text(
                          "Faça login.",
                          style: TextStyle(fontSize: 16, color: Colors.purple, fontWeight: FontWeight.bold),
                        ),
                        onTap: null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
