import 'package:flutter/material.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';
import 'package:gestro_app/widgets/bottomNavigatorBarGestro.widget.dart';

class AprovacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGestro(title: "Aprovações"),
      bottomNavigationBar: BottomNavigatorBarGestro(),
    );
  }
}
