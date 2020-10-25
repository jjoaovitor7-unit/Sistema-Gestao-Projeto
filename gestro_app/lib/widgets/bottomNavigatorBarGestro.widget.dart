import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class BottomNavigatorBarGestro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: purpleSecudary,
      // onTap: (value) {
      // if (value == 0)
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => HomePage(),
      //     ),
      //   );
      // if (value == 1)
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => null,
      //     ),
      //   );
      // if (value == 2)
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => null,
      //     ),
      //   );
      // if (value == 3)
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => null,
      //     ),
      //   );
      // if (value == 4)
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => null,
      //     ),
      //   );
      // },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.house_user,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesome5.clipboard_check,
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
