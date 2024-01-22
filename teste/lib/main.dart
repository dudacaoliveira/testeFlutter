import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste/view/HomePage.dart';
import 'package:teste/view/Login.dart';
import 'view/Splash.dart';
//usuario = user e a senha = 123456
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => Splash()),
      GetPage(name: '/Login', page: () => Login()),
      GetPage(name: '/HomePage', page: () => HomePage())
    ],
        home: const Splash(),

  ));
}

