import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/cadastro_screen.page.dart';
import 'pages/login_screen.page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(CadastroScreen());
}
