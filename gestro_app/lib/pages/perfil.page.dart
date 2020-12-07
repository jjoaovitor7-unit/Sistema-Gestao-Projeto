import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestro_app/models/user_model.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/buttonGestro.widget.dart';
import 'package:gestro_app/extensions/sigla.dart';
import 'package:gestro_app/widgets/bottomNavigation.dart';

import 'package:gestro_app/globals.dart' as globals;

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  UserModel usuario;
  // FirebaseAuth firebaseAuth;

  void initState() {
    super.initState();
    getUser().then((user) {
      setState(() {
        usuario = user;
        print("==================$user");
      });
    });
  }

  Future<UserModel> getUser() {
    return FirebaseAuth.instance.authStateChanges().firstWhere((user) => user != null).then((user) {
      String uid = user.uid;
      print(uid);
      return FirebaseFirestore.instance.collection("Users").doc(uid).get().then((value) {
        print("------------------------------->${value}");
        print("------------------------------->${value.id}");
        print("------------------------------->${value.reference}");
        print("------------------------------->${value.exists}");
        print("------------------------------->${value.data()}");
        print("------------------------------->${value.toString()}");
        return UserModel.fromJson(value.data(), value.reference);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (usuario == null) {
      return CircularProgressIndicator();
    }
    return Scaffold(
        appBar: AppBarGestro(
          title: "Perfil",
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/BkPerfil.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.52,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: purpleSecudary,
                              blurRadius: 0,
                              spreadRadius: 3.0,
                              offset: Offset(
                                0,
                                0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: CircularProfileAvatar(
                          '',
                          borderColor: Colors.white,
                          borderWidth: 3.5,
                          radius: 35,
                          backgroundColor: Colors.purple[200],
                          initialsText: Text(
                            usuario.name.toSiglas,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: purpleSecudary,
                        height: MediaQuery.of(context).size.height * 0.07,
                        thickness: 1.5,
                        endIndent: MediaQuery.of(context).size.width * 0.38,
                        indent: MediaQuery.of(context).size.width * 0.38,
                      ),
                      Text(
                        usuario.name,
                        style: TextStyle(
                          color: purpleSecudary,
                          fontSize: MediaQuery.of(context).size.height * 0.028,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        usuario.email,
                        style: TextStyle(fontStyle: FontStyle.italic, color: grey),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        usuario.curriculum,
                        style: TextStyle(fontStyle: FontStyle.italic, color: purpleSecudary),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Divider(
                        color: Colors.black,
                        endIndent: MediaQuery.of(context).size.width * 0.05,
                        indent: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height * 0.055,
                        decoration: BoxDecoration(
                          color: purpleSecudary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        margin: EdgeInsets.only(top: 15),
                        child: Center(
                          child: Container(
                            child: Text(
                              "Atualizar dados",
                              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
