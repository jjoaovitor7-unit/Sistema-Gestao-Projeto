import 'package:flutter/material.dart';
import 'package:gestro_app/widgets/appBarGestro.widget.dart';

class AprovacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarGestro(title: "Aprovações"),
      ),
    );
  }
}
