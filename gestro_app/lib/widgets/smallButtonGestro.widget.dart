import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class SmallButtonGestro extends StatelessWidget {
  final String text;
  final Function onTap;
  final IconData icon;

  const SmallButtonGestro({@required this.text, @required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
          color: purpleSecudary,
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          ),
          border: Border.all(
            color: purpleSecudary,
          ),
        ),
        margin: EdgeInsets.only(top: 15),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
