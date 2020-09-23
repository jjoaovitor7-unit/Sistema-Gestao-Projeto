import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.light, primaryColor: Colors.purple),
      home: CadastroScreen_(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CadastroScreen_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/BkRegisterScreen.png"),
              fit: BoxFit.fill),
        ),
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 35),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 245),
              child: Center(
                child: Text(
                  "Cadastro",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height * 0.08,
              color: Colors.purple[200],
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nome',
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                  border: InputBorder.none,
                  icon: Icon(Icons.person, size: 35),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height * 0.08,
              color: Colors.purple[200],
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                  border: InputBorder.none,
                  icon: Icon(Icons.email, size: 35),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height * 0.08,
              color: Colors.purple[200],
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                  border: InputBorder.none,
                  icon: Icon(Icons.lock, size: 35),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height * 0.08,
              color: Colors.purple[200],
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirme a senha',
                  hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                  border: InputBorder.none,
                  icon: Icon(Icons.lock, size: 35),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(
                color: Colors.purple,
                onPressed: null,
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Container(
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
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
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
