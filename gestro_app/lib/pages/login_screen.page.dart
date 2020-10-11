import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestro_app/pages/cadastro_screen.page.dart';
import 'package:gestro_app/widgets/buttonGestro.widget.dart';
import 'package:gestro_app/widgets/containerGestro.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestro_app/globals.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/BkLoginScreen.png",
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 320,
            left: 35,
            right: 35,
          ),
          child: ListView(
            children: <Widget>[
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ContainerGestro(
                text: "Email",
                icon: Icon(
                  Icons.email,
                ),
                valueForm: email,
              ),
              ContainerGestro(
                text: "Senha",
                icon: Icon(
                  Icons.lock,
                ),
                passVisible: true,
                valueForm: senha,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    var instance = FirebaseAuth.instance;
                    await instance.signInWithEmailAndPassword(
                      email: email,
                      password: senha,
                    );
                  } on FirebaseAuthException catch (exception) {
                    switch (exception.code) {
                      case 'user-not-found':
                        print(
                          'Usuário não encontrado.',
                        );
                        break;
                      case 'wrong-password':
                        print(
                          'Senha incorreta.',
                        );
                        break;
                      default:
                        print(
                          'Por favor, tente novamente mais tarde.',
                        );
                        break;
                    }
                  }
                  Future.delayed(
                    Duration(
                      milliseconds: 0,
                    ),
                  ).then(
                    (_) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            // TODO Chamar próxima tela
                            // builder: (context) => ***,
                            ),
                      );
                    },
                  );
                },
                child: ButtonGestro(
                  text: 'Login',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 55,
                    ),
                    child: Text(
                      "Não possui cadastro?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 55,
                      left: 5,
                    ),
                    child: InkWell(
                      child: Text(
                        "Cadastrar-se.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Future.delayed(
                          Duration(
                            milliseconds: 0,
                          ),
                        ).then(
                          (_) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CadastroScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
