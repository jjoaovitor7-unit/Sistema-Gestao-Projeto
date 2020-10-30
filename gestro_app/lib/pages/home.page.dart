import 'package:flutter/material.dart';
import 'package:gestro_app/pages/aprovacoes.page.dart';
import 'package:gestro_app/pages/detalheProjeto.page.dart';
import 'package:gestro_app/pages/projetos.page.dart';
import '../globals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    ProjetosPage(),
    AprovacoesPage(),
    AprovacoesPage(),
    AprovacoesPage(),
    AprovacoesPage(),
    DetalheProjeto(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPages = _pages[currentIndexSection];
    return Scaffold(
      body: _pages[currentIndexSection],
    );
  }
}
