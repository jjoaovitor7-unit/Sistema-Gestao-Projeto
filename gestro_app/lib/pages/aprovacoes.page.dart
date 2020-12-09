import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/models/project.model.dart';
import 'package:gestro_app/models/user_model.dart';
import 'package:gestro_app/widgets/bottomNavigation.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardAprovacao.page.dart';
import 'package:gestro_app/widgets/cardPesquisador.page.dart';
import 'package:gestro_app/widgets/cardProjetos.widget.dart';
import 'package:gestro_app/widgets/inputGestroGrande.widget.dart';
import '../globals.dart';

class AprovacoesPage extends StatefulWidget {
  @override
  _AprovacoesPageState createState() => _AprovacoesPageState();
}

class _AprovacoesPageState extends State<AprovacoesPage> {
  UserModel usuario;
  // FirebaseAuth firebaseAuth;

  List<UserModel> pesquisadores;
  List<ProjectModel> projetos;

  Future<UserModel> getUser() {
    return FirebaseAuth.instance.authStateChanges().firstWhere((user) => user != null).then((user) {
      String uid = user.uid;
      print(uid);
      return FirebaseFirestore.instance.collection("Users").doc(uid).get().then((value) {
        return UserModel.fromJson(value.data(), value.reference);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getUser().then((user) {
      FirebaseFirestore.instance.collection('Users').get().then(
        (snapshot) {
          print("======================!!!!!!!!!!!!!!!!!!!!!!!!!!$user");
          if (snapshot.docs.isNotEmpty) {
            snapshot.docs.forEach((element) {
              var usuarioColecao = UserModel.fromJson(element.data(), element.reference);
              if (usuarioColecao.type == "Pesquisador" && usuarioColecao.activationStatus == null) {
                // print("olaaaaaaaaaaaaaa ${usuarioColecao.}");
                setState(() {
                  print("0000000000000000 $usuarioColecao");
                  pesquisadores.add(usuarioColecao);
                });
              }
            });
          }
        },
      );
      setState(() {
        usuario = user;
      });
    });

    FirebaseFirestore.instance.collection('Projects').get().then(
      (snapshot) {
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.forEach((element) {
            var projetoColecao = ProjectModel.fromJson(element.data(), element.reference);
            if (projetoColecao.activationStatus == null) {
              // print("olaaaaaaaaaaaaaa ${usuarioColecao.}");
              setState(() {
                projetos.add(projetoColecao);
              });
            }
          });
        }
      },
    );

    pesquisadores = [];
    projetos = [];
  }

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('Projects');

  Future<QuerySnapshot> getData() {
    final Completer<QuerySnapshot> c = new Completer();
    collectionReference.snapshots().listen((data) {
      c.complete(Future.value(data));
    });
    return c.future;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          bottomNavigationBar: BottomNavigation(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
            child: AppBarGestro(
              title: "Aprovações",
              tabBar: true,
              tabBar1: Tab(
                child: Text(
                  'Projetos',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              tabBar2: Tab(
                child: Text(
                  'Pesquisadores',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: gradientGestro,
                ),
                child: FutureBuilder<QuerySnapshot>(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: projetos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CardAprovacao(
                                index: index,
                                projectModel: ProjectModel.fromJson(
                                  snapshot.data.docs[index].data(),
                                  snapshot.data.docs[index].reference,
                                ),
                              );
                            },
                          )
                        : CircularProgressIndicator();
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: gradientGestro,
                ),
                child: ListView.builder(
                  itemCount: pesquisadores.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardPesquisador(
                      name: pesquisadores[index].name,
                      email: pesquisadores[index].email,
                      curriculum: pesquisadores[index].curriculum,
                      pesquisador: pesquisadores[index],
                      onTap: () {
                        setState(() {
                          pesquisadores = pesquisadores;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
