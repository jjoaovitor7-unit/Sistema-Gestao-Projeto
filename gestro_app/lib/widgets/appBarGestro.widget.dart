import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class AppBarGestro extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool tabBar;
  final String tabBarName1;
  final String tabBarName2;

  const AppBarGestro({
    @required this.title,
    this.tabBar = false,
    this.tabBarName1,
    this.tabBarName2,
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
          ? TabBar(
              onTap: (value) {},
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Projetos',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Pesquisadores',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
