extension StringExtension on String {
  get toSiglas {
    if (this != null) return initialUser(this);
  }
}

String initialUser(String nomeCompleto) {
  List<String> nome = nomeCompleto.split(" ");
  return nome[0][0] + (nome.length > 1 ? nome[1][0] : "");
}
