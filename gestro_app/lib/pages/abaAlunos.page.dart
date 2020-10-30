import 'package:flutter/material.dart';

class AbaAluno extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/BkAlunos.jpg",
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
