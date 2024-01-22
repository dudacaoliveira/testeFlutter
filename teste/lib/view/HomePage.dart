import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/model/Nota.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingControllerUp = TextEditingController();
  List<Nota> notas = List.empty(growable: true);


  _salvar() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> notaList = notas.map((nota) => jsonEncode(nota.toJson())).toList();
    prefs.setStringList('nome', notaList);

  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? notaList = prefs.getStringList("nome");
    setState(() {
      if(notaList !=null){
        notas =  notaList.map((nota) => Nota.fromJson(json.decode(nota))).toList();
      }
    });
  }

  _update(String indice){
    setState(() {
      if(_textEditingControllerUp.text.isNotEmpty){
        String valorDigitado = _textEditingControllerUp.text.trim();
        notas.removeAt(int.parse(indice));
        notas.insert(int.parse(indice), Nota(conteudo: valorDigitado));
        _salvar();

      }
    });

  }


  void _abrirUrl() async {
    const url = 'https://www.Google.com.br/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }


  //-------------------------Dialog Cadastrar------------------------------

  _showCadastrar(){
    return
      Get.defaultDialog(
          title: "",
          content: Container(
            width: 400,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Incluir Nome",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        autofocus: false,
                        autocorrect: true,
                        //onChanged: _salvar(),
                        controller: _textEditingController,
                        textInputAction: TextInputAction.done,
                        /*onEditingComplete: (){
                            if(_textEditingController.text.isNotEmpty){
                              setState(() {
                                String valorDigitado = _textEditingController.text.trim();
                                notas.add(Nota(conteudo: valorDigitado));
                                //_textEditingController.clear();
                              });
                              //_salvar();
                            }else{
                              showDialog(context: context, builder: (context){
                                return  AlertDialog(
                                  content: const Text("Favor digitar!"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("OK"),
                                    ),
                                  ],
                                );
                              });
                            }
                            FocusScope.of(context).unfocus();
                          },*/
                        decoration: const InputDecoration(
                          label: Text("Nome"),
                          //border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          child: TextButton(onPressed: (){
                            print("clicou em cadastrar");
                            if(_textEditingController.text.isNotEmpty){
                              setState(() {
                                String valorDigitado = _textEditingController.text.trim();
                                notas.add(Nota(conteudo: valorDigitado));
                                _salvar();
                                _textEditingController.clear();
                              });
                            }else{
                              showDialog(context: context, builder: (context){
                                return  AlertDialog(
                                  content: const Text("Favor digitar!"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("OK"),
                                    ),
                                  ],
                                );
                              });
                            }
                            Navigator.pop(context);
                          }, child: Text("Confirmar")),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          )
      );
  }


  //--------------------------Dialog UpDate--------------------------------
  _showAtualizar(String indice, String conteudo){
    _textEditingControllerUp.text = conteudo;
    return
      Get.defaultDialog(
          title: "",
          content: SingleChildScrollView(
            child: Container(
                width: 400,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 35),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 50,
                        padding:const EdgeInsets.only(
                            top: 8,left: 16,right: 16,bottom: 4
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 10
                              )
                            ]
                        ),

                        child: TextFormField(
                          onTap: (){
                            setState(() {
                              //corblurTextFieldUsu = Colors.bl;
                              //corblurTextFieldSenha = Colors.black26;
                            });
                          },
                          autofocus: false,
                          autocorrect: true,
                          controller: _textEditingControllerUp,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration.collapsed(
                            //icon: Icon(Icons.email,color: Colors.black26,size: 20,),
                              hintText: ("Atualizar")
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: (){
                          print("clicou em cadastrar");
                          _update(indice);
                          Navigator.pop(context);
                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width/1.4,
                          height:50,
                          decoration: const BoxDecoration(

                              gradient: LinearGradient(colors:[
                                Color(0xFF2962FF),
                                Color(0xFF2962FF),
                                //Color(0xFF9C27B0),
                              ]
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              )
                          ),
                          child:const Center(
                            child: Text("Atualizar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ) ,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("ID: " + "${indice}",style: TextStyle(color: Colors.black12,fontSize: 8),),
                      )
                    ],
                  ),
                )
            ),
          )
      );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getPreferences();//Carrega os dados do arquivo
    _recuperar();

  }
  Controller controller = Controller();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text("Lista de Presença"),
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 100,),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Observer(builder: (_){
                  return ListView.builder(
                      itemCount: notas.length,
                      itemBuilder: (context,indice){
                        return  Card(
                          elevation: 2,
                          child: ListTile(
                            title: Row(
                              children: [
                                Expanded(child: IconButton(onPressed: (){
                                  showDialog(context: context, builder: (context){
                                    return  AlertDialog(
                                      content: const Text("Deseja realmente apagar?"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: const Text("Cancelar"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {setState(() {
                                            notas.removeAt(indice);
                                            _salvar();
                                            Navigator.pop(context);
                                          });},
                                          child: const Text("Ok"),
                                        )
                                      ],
                                    );
                                  });
                                }, icon: const Icon(Icons.delete_forever,color: Colors.red,))
                                ),
                                Expanded(
                                  child: Text("${notas[indice].conteudo}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                    ),
                                  ),
                                  flex: 5,
                                ),
                                Expanded(child: IconButton(onPressed: (){
                                  print(" ${notas[indice].conteudo}");
                                  print(indice);
                                  _showAtualizar(indice.toString(),notas[indice].conteudo);
                                }, icon: const Icon(Icons.edit,color: Colors.black,))),
                                const SizedBox(width: 10,),

                              ],
                            ),//subtitle: const Divider(),
                          ),
                        );
                      }
                  );
                }
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.person_add),
        backgroundColor: Colors.green,
          elevation: 0,
          onPressed: (){_showCadastrar();}, label: Text("Adicionar")),
    );
  }
}
