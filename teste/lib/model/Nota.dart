// To parse this JSON data, do
//
//     final nota = notaFromJson(jsonString);

import 'dart:convert';

/*List<Nota> notaFromJson(String str) => List<Nota>.from(json.decode(str).map((x) => Nota.fromJson(x)));

String notaToJson(List<Nota> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));*/

class Nota {
  String conteudo;

  Nota({
    required this.conteudo,
  });

  factory Nota.fromJson(Map<String, dynamic> json) => Nota(
    conteudo: json["conteudo"],
  );

  Map<String, dynamic> toJson() => {
    "conteudo": conteudo,
  };
}
