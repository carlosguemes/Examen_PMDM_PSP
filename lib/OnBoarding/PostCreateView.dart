import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../CustomViews/TextClass.dart';
import '../FirestoreObjects/FbPost.dart';
import '../Singletone/DataHolder.dart';

class PostCreateView extends StatefulWidget{
  @override
  State<PostCreateView> createState() => _PostCreateViewState();
}

class _PostCreateViewState extends State<PostCreateView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController tecTitulo = TextEditingController();

  TextEditingController tecCuerpo = TextEditingController();

  void subirPost() async{

    FbPost postNuevo = new FbPost(
      titulo: tecTitulo.text,
      cuerpo: tecCuerpo.text,
    );

    DataHolder().fa.crearPostEnFB(postNuevo);

    Navigator.of(context).pushNamed('/homeview');

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(title: Text(DataHolder().sNombre)),
      body: Column(
        children: [
          TextClass(controlador: tecTitulo, labelText: "Escribe el título", esContrasenya: false),
          TextClass(controlador: tecCuerpo, labelText: "Escribe el cuerpo", esContrasenya: false),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: subirPost, child: Text("Postear")),
            ],
          ),
        ],
      ),
    );
  }
}