import 'package:gestro_app/models/user_model.dart';
import 'package:gestro_app/models/project.model.dart';

String nome;
String email;
String senha;
String curriculum;

// current index section para a BottomNavigationBar().
int currentIndexSection = 0;

String nomeProjeto;
String descProjeto;
String dataInicio;
String dataTermino;

ProjectModel projectModelGlobal;

UserModel user = UserModel(name: "Nome Pesquisador1", type: "Pesquisador");
