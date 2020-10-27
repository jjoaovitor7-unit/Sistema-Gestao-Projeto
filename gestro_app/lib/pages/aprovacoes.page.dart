import 'package:flutter/material.dart';
import 'package:gestro_app/themes/globals.themes.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/cardAprovacoes.page.dart';
import 'package:gestro_app/widgets/cardProjetos.widget.dart';
import 'package:gestro_app/widgets/containerGestroGrande.widget.dart';

class AprovacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.16),
            child: AppBarGestro(
              title: "Aprovações",
              tabBar: true,
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: gradientGestro,
                ),
                child: ListView(
                  children: [
                    CardAprocaoes(),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: gradientGestro,
                ),
              ),
            ],
          )),
    );
  }
}
