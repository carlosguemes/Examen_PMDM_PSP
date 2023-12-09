import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_carlos_guemes/Singletone/DataHolder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSession();
  }

  void checkSession() async{
    if (!await DataHolder().fa.comprobarSesion()){
      Navigator.of(context).popAndPushNamed("/loginview");
    }

    else{
      Navigator.of(context).popAndPushNamed("/registerview");
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    String ruta = "resources/logo_kyty.png";

    Column column = Column(
        children: [
          Image.asset(ruta, width: 300, height: 300, fit: BoxFit.fill,),
          Padding(padding: EdgeInsets.symmetric(vertical: 30)),
          CircularProgressIndicator(),
        ]
    );
    return column;
  }
}