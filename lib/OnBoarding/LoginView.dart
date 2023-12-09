import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_carlos_guemes/Singletone/DataHolder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../CustomViews/TextClass.dart';

class LoginView extends StatelessWidget {

  late BuildContext _context;

  TextEditingController tecUsername = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  void onClickAceptar() async {
   DataHolder().fa.onClickLogin(tecUsername, tecPassword);
   Navigator.of(_context).popAndPushNamed('/homeview');
  }

  void onClickRegistrar(){
    Navigator.of(_context).popAndPushNamed('/registerview');
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    AppBar appBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      title: const Text('Login'),
    );

    Column columna = Column(children: [
      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      Text("Bienvenido al Login", style: TextStyle(fontSize: 25)),
      Padding(padding: EdgeInsets.symmetric(vertical: 10)),

      TextClass(controlador: tecUsername, labelText: 'Escribe tu usuario', esContrasenya: false),

      TextClass(controlador: tecPassword, labelText: 'Escribe tu contraseña', esContrasenya: true),

      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 10),
          child: TextButton(onPressed: onClickAceptar,
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: Text("Aceptar")), ),

        Padding(padding: EdgeInsets.symmetric(vertical: 10),
          child: TextButton(onPressed: onClickRegistrar,
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: Text("Registro")),)
      ],)

    ]);

    Scaffold scaffold = Scaffold (
      appBar: appBar,
      body: columna,
      backgroundColor: Colors.blueGrey,
    );

    return scaffold;
  }
}