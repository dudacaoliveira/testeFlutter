import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste/view/HomePage.dart';
import 'package:url_launcher/url_launcher.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final teste = "";
  final TextEditingController _textEditingControllerUsuario = TextEditingController();
  final TextEditingController _textEditingControllersenha = TextEditingController();

  final focus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  Color corblurTextFieldUsu = Colors.black;
  Color corblurTextFieldSenha = Colors.black;
  bool passwordVisible = false;
  String pass = "123456";
  String usuario = "user";

  bool _validarCaracter(String value) {
    String patttern = r'(^[a-zA-Z-0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (!regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  void limpaCampos(){
    _textEditingControllerUsuario.clear();
    _textEditingControllersenha.clear();
  }

  logar(){
    limpaCampos();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const HomePage()
      ),
    );
  }

  void _abrirUrl() async {
    const url = 'https://www.Google.com.br/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

  _validaSenha(){
    if(_formKey.currentState!.validate()){
      if(_textEditingControllersenha.text != pass || _textEditingControllerUsuario.text != usuario){
        //chama Dialogo Senha Incorreta
        _dialogoSenha();
      }else{
        //chama p/ próxima tela
        logar();
      }
    }
  }

      _dialogoSenha(){
    return
      Get.defaultDialog(
        titleStyle: TextStyle(color: Colors.redAccent),
          title: "ACESSO NEGADO!",
          middleText: "Verifique a senha e usuário!"
      );
    }

  _showDialod(){
    _textEditingControllerUsuario.clear();
    _textEditingControllersenha.clear();
    return
      Get.defaultDialog(
          title: "",
          content: SingleChildScrollView(
            child: Container(
                child: Form(
                  key: _formKey2,
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
                              corblurTextFieldUsu = Colors.red;
                              corblurTextFieldSenha = Colors.black26;
                            });
                          },
                          autofocus: false,
                          autocorrect: true,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration.collapsed(
                            //icon: Icon(Icons.email,color: Colors.black26,size: 20,),
                              hintText: ("Usuário")
                          ),
                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(focus);
                          },
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        margin: const EdgeInsets.only(top: 16),
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
                          focusNode: focus,
                          obscureText: !passwordVisible,
                          controller: _textEditingControllersenha,
                          autofocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: (){},
                              icon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                child: Icon(
                                  // Muda o ícone de acor do com o valor boleano da variável passwordVisible
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                            ),
                            hintText: ("SenhaAA"),

                          ),
                          onTap: (){
                            setState(() {
                              corblurTextFieldUsu = Colors.black26;
                              corblurTextFieldSenha = Colors.red;
                            });
                            //funcao();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: (){
                          //logar();
                          //print("Sim");
                          //valida2(_status_servidor);
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
                            child: Text("Cadastrar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ) ,
                        ),
                      ),
                    ],
                  ),
                )
            ),
          )
      );
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                  Color(0xFF06293b),
                  Color(0xFF0a5053),
                  Color(0xFF1ea392),
                ]
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0,bottom:4),
                        child: Text("Usuário",style: TextStyle(color: Colors.white),),
                      ),

                      Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          child: TextFormField(

                            controller: _textEditingControllerUsuario,
                            autofocus: false,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'O campo não pode ser vazio';
                              }if(value.length < 2){
                                return 'O campo deve conter no mínimo 2 caracteres';
                              }
                              if(value.length > 20){
                                return "No máximo 20 caracters";
                              }
                              return null;
                            },
                            onFieldSubmitted: (v){
                              FocusScope.of(context).requestFocus(focus);
                            },
                            decoration:  const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person,color: Colors.black,),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.white

                          )
                      ),

                    ],
                  ),
                  const SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left:8.0,bottom:4 ),
                        child: Text("Senha",style: TextStyle(color: Colors.white),),
                      ),
                      //Novo TExt---------------------------------------------------
                      Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          child: TextFormField(
                            focusNode: focus,
                            //obscureText: !passwordVisible,
                            controller: _textEditingControllersenha,
                            autofocus: false,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return 'O campo não pode ser vazio';
                              }if(value.length < 2){
                                return 'O campo deve conter no mínimo 2 caracteres';
                              }if(value.length > 20){
                                return 'No máximo 20 caracters';
                              }
                              if(_validarCaracter(_textEditingControllersenha.text) == true){
                                return 'O campo não pode ter caracter especial';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.lock,color: Colors.black,),
                            ),
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Colors.white
                                  
                          )
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: (){
                      _validaSenha();
                    },
                    child: Container(
                      width:MediaQuery.of(context).size.width/2.4,
                      height:50,
                      decoration: const BoxDecoration(

                          gradient: LinearGradient(colors:[
                            Colors.green,
                            Colors.green,
                            //Color(0xFF9C27B0),
                          ]
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(30)
                          )
                      ),
                      child:const Center(
                        child: Text("Entrar",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ) ,
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () => _abrirUrl(), label: Text("Política de Privacidade")),
    );
  }
}

