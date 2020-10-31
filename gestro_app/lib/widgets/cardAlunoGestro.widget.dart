import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:gestro_app/themes/globals.themes.dart';

class CardAlunoGestro extends StatelessWidget {
  final String name;
  final String email;
  final String initials;
  final bool popMenu;

  const CardAlunoGestro({
    @required this.initials,
    @required this.name,
    @required this.email,
    this.popMenu = true,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Row(
          children: [
            CircularProfileAvatar(
              '',
              radius: 35,
              backgroundColor: Colors.purple[200],
              initialsText: Text(this.initials,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple)),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    this.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 25),
                  child: Text(this.email,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.white)),
                ),
                this.popMenu == true
                    ? Container(
                        // color: Colors.blue,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.64),
                        child: PopupMenuButton(
                            // key: _menuKey,
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            color: purpleSecudary,
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                                  new PopupMenuItem<String>(
                                      child: const Text(
                                        'Editar',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        // textAlign: TextAlign.center,
                                      ),
                                      value: 'Editar'),
                                  new PopupMenuItem<String>(
                                      child: const Text(
                                        'Excluir',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      value: 'Excluir'),
                                ],
                            onSelected: (_) {}),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
