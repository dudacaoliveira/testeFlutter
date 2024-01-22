import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/Nota.dart';

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  int escut = 0;

  @observable
  String item = "";

  @action
  void setItem(String valor) => item = valor;
    

  
  ObservableList<Nota> notas = ObservableList();

  @action
  void adicionar(){
    Nota nota = Nota(conteudo: item);
    notas.add(nota);
    print(notas);
  }

/*
  @action
salvar() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> notaList = notas.map((nota) => jsonEncode(nota.toJson())).toList();
    prefs.setStringList('myData', notaList);
  }
  @action
  remove(int indice)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(indice.toString());
    //notas.removeAt(indice);
  }
  @action
  Action acionador;
  var x = "";

  Controller(){
    acionador = Action(_salvar());
    acionador = Action(_recuperar());
    acionador = Action(_update(x,));
  }
  @action
  _salvar() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> notaList = notas.map((nota) => jsonEncode(nota.toJson())).toList();
    prefs.setStringList('myData', notaList);

  }
  @action
  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? notaList = prefs.getStringList("myData");
    if(notaList !=null){
      notas =  notaList.map((nota) => Nota.fromJson(json.decode(nota))).toList();
    }
  }

  @action
  _update(String indice, TextEditingController _textEditingControllerUp){
    if(_textEditingControllerUp.text.isNotEmpty){
      String valorDigitado = _textEditingControllerUp.text.trim();
      notas.removeAt(int.parse(indice));
      notas.insert(int.parse(indice), Nota(conteudo: valorDigitado));
      _salvar();
    }
  }

  Controller(){
    acionador = Action(_salvar());
    acionador = Action(_recuperar());
    acionador = Action(_update(x,));
  }*/
}