import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/models/project.model.dart';
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
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Projects');

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
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
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
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CardAprovacao(
                                index: index,
                                projectModel: ProjectModel.fromJson(
                                    snapshot.data.docs[index].data()),
                              );
                            },
                          )
                        : CircularProgressIndicator();
                  },
                ),
                // child: ListView(
                //   children: [
                //     CardAprocao(),
                //     CardAprocao(),
                //     CardAprocao(),
                //   ],
                // ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: gradientGestro,
                ),
                child: ListView(
                  children: [
                    CardPesquisador(),
                    CardPesquisador(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
