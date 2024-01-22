import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});



  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future<bool>? _future;
  Alignment ali = Alignment.topCenter;
  double opacidade = 0;

  Future<String> _chamaTelaLogin() async {
    await Future.delayed(Duration(milliseconds: 4000), () {});
    Get.offAllNamed("/Login");
    return "1";
  }

  Future validaUsuario()async{
    //Aqui neste bloco será verificado se o usuário está logado
    //Se estiver logado vai para tela Index se não vai para a tela de Login
    await Future.delayed(const Duration(milliseconds: 300));//espera esse tempo para executar o prox comando
    setState(() {
      ali = Alignment.center;
    });
    _chamaTelaLogin();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    validaUsuario();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.indigoAccent,
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
          child: SafeArea(
            child: FutureBuilder<bool>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  final isEven = snapshot.data ?? false;
                  return AnimatedAlign(
                      duration: Duration(milliseconds: 2700),
                      curve: Curves.elasticInOut,
                      alignment: ali,
                      child: Container(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("img/logo1.png", height: 200,),
                            const Text("Lista de Presença",style: TextStyle(color: Colors.white70,fontSize: 35),),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 1,
                              ),
                            ),
                            //Text("FROM DISCOMED",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white70),),


                          ],
                        ),
                      )
                  );
                }
              },
            ),
          ),
        ),

      ),
    );
  }
}
