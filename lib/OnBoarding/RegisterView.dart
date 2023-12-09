import 'package:examen_carlos_guemes/Singletone/DataHolder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../CustomViews/TextClass.dart';

class RegisterView extends StatelessWidget{

  late BuildContext _context;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  SnackBar snackBar = SnackBar(
    content: Text('Las contraseñas han de ser iguales'),
  );

  void onClickAceptarRegistrar() async {
    DataHolder().fa.onClickRegistrar
      (usernameController, passwordController, repasswordController);
    Navigator.of(_context).popAndPushNamed('/loginview');
  }

  void onClickCancelarRegistrar(){
    Navigator.of(_context).popAndPushNamed('/loginview');
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    AppBar appBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      title: const Text('Registro'),
    );

    Column columna = Column(children: [
      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      Text('Bienvenido al Registro', style: TextStyle(fontSize: 25)),
      Padding(padding: EdgeInsets.symmetric(vertical: 10)),

      TextClass(controlador: usernameController, labelText: 'Escribe tu usuario', esContrasenya: false),

      TextClass(controlador: passwordController, labelText: 'Escribe tu contraseña', esContrasenya: true),

      TextClass(controlador: repasswordController, labelText: 'Repite tu contraseña', esContrasenya: true),

      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 10),
          child: TextButton(onPressed: onClickAceptarRegistrar,
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: Text("Aceptar")),),

        Padding(padding: EdgeInsets.symmetric(vertical: 10),
          child: TextButton(onPressed: onClickCancelarRegistrar,
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: Text("Cancelar")),)
      ],)

    ]);

    Scaffold scaffold = Scaffold(
        body: columna,
        backgroundColor: Colors.orangeAccent,
        appBar: appBar
    );

    return scaffold;
  }

}