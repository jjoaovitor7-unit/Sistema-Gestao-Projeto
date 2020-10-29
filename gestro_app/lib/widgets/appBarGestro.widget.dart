import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class AppBarGestro extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool tabBar;
  final bool isThree;
  final Tab tabBar1;
  final Tab tabBar2;
  final Tab tabBar3;

  const AppBarGestro({
    @required this.title,
    this.tabBar = false,
    this.isThree,
    this.tabBar1,
    this.tabBar2,
    this.tabBar3,
  });

  @override
  _AppBarGestroState createState() => _AppBarGestroState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarGestroState extends State<AppBarGestro> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.widget.title),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back,
        ),
      ),
      centerTitle: true,
      backgroundColor: purpleSecudary,
      actions: [
        Icon(
          FontAwesome.bell_alt,
          size: MediaQuery.of(context).size.height * 0.028,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        )
      ],
      bottom: this.widget.tabBar
          ? this.widget.isThree == true
              ? TabBar(
                  onTap: (value) {},
                  indicatorColor: Colors.white,
                  tabs: [
                    this.widget.tabBar1,
                    this.widget.tabBar2,
                    this.widget.tabBar3,
                  ],
                )
              : TabBar(
                  onTap: (value) {},
                  indicatorColor: Colors.white,
                  tabs: [
                    this.widget.tabBar1,
                    this.widget.tabBar2,
                  ],
                )
          : null,
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
