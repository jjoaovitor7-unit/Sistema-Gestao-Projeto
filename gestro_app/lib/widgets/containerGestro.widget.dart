import 'package:flutter/material.dart';
import 'package:gestro_app/pages/themes/globals.themes.dart';

class ContainerGestro extends StatelessWidget {
  final String text;
  final Icon icon;
  final bool passVisible;

  const ContainerGestro({@required this.text, @required this.icon, this.passVisible = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: purplePrimary,
      ),
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 20, right: 10),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height * 0.08,
      child: TextFormField(
        obscureText: passVisible,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(fontSize: 20, color: Colors.white),
          border: InputBorder.none,
          // icon: icon,
          suffixIcon: icon,
        ),
      ),
    );
  }
}
