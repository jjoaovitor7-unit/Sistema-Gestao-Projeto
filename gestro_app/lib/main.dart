import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestro_app/pages/splash_screen.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      //       localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      // supportedLocales: [const Locale('pt', 'BR')],
      title: 'Gestro App',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // initialRoute: '/',
      // routes: <String, WidgetBuilder>{
      //   '/': (context) => CadastroScreen(),
      // },
    );
  }
}
