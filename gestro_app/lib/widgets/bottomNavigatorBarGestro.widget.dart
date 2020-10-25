import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/pages/aprovacoes.page.dart';
import 'package:gestro_app/pages/home.page.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class BottomNavigatorBarGestro extends StatefulWidget {
  @override
  _BottomNavigatorBarGestroState createState() => _BottomNavigatorBarGestroState();
}

class _BottomNavigatorBarGestroState extends State<BottomNavigatorBarGestro> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: purpleSecudary,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        // setState();
        if (index == 0)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        if (index == 1)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AprovacoesPage(),
              // maintainState: true,
            ),
          );
        // if (index == 2)
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => null,
        //     ),
        //   );
        // if (index == 3)
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => null,
        //     ),
        //   );
        // if (index == 4)
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => null,
        //     ),
        //   );
        setState(
          () {
            this._currentIndex = index;
            // print(index);
          },
        );
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.house_user,
            // color: index == 0 ? purpleSecudary : Colors.grey,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.clipboard_check,
            // color: index == 1 ? purpleSecudary : Colors.grey,
          ),
          label: "Projetos",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.list,
          ),
          label: "Tarefas",
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.users,
          ),
          label: "Alunos",
          backgroundColor: Colors.amber,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.user,
          ),
          label: "Perfil",
        ),
      ],
    );
  }
}
