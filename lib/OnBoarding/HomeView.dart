import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_carlos_guemes/Singletone/DataHolder.dart';
import 'package:flutter/material.dart';

import '../CustomViews/BottomMenu.dart';
import '../CustomViews/DrawerClass.dart';
import '../CustomViews/GridBuilderCell.dart';
import '../CustomViews/PostCellView.dart';
import '../FirestoreObjects/FbPost.dart';
import 'LoginView.dart';

class HomeView extends StatefulWidget {  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late BuildContext _context;

  bool bIsList = false;

  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FbPost> post = [];

  @override
  void initState(){
    descargarPosts();
    super.initState();
  }

  void descargarPosts() async{
    CollectionReference<FbPost> reference = DataHolder().fa.descargarPosts();

    QuerySnapshot<FbPost> querySnap = await reference.get();
    for (int i = 0; i < querySnap.docs.length; i++){
      setState(() {
        post.add(querySnap.docs[i].data());
      });
    }
    /*print('Inicio');
    CollectionReference<FbPost> reference = db
        .collection("Posts")
        .withConverter(fromFirestore: FbPost.fromFirestore,
        toFirestore: (FbPost post, _) => post.toFirestore());
    print('Descarga post');
    QuerySnapshot<FbPost> querySnap = await reference.get();
    for (int i = 0; i < querySnap.docs.length; i++){
      setState(() {
        print('Post ' + i.toString());
        post.add(querySnap.docs[i].data());
      });
    }
    print('Descarga hecha');*/
  }

  Widget? creadorDeItemLista(BuildContext context, int index){
    return PostCellView(sText: post[index].titulo,
      dFontSize: 20,
      mcColores: Colors.red,
      iPosicion: index,
      //onItemListaClickedFunction: onItemListaClicked,
    );
  }

  Widget creadorDeSeparadorLista(BuildContext context, int index){
    return Divider(color: Colors.purpleAccent);
  }

  Widget creadorCeldas(BuildContext context, int index){
    return GridBuilderCell(
      post: post,
      iPosicion: index,
      //onItemListaClickedFunction: onItemListaClicked,
    );
  }

  Widget celdasOLista(bool isList) {
    if (isList) {
      return ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: post.length,
        itemBuilder: creadorDeItemLista,
        separatorBuilder: creadorDeSeparadorLista,
      );
    } else {
      return creadorCeldas(context, post.length);
    }
  }

  void onBottomMenuPressed(int indice) {
    setState(() {
      if (indice == 0){
        bIsList = true;
      }
      else if (indice == 1){
        bIsList = false;
      }
    });
  }

  void eventoDrawerClass(int indice){
    if (indice == 0){
      DataHolder().fa.signOut;
      Navigator.of(context).pushAndRemoveUntil (
        MaterialPageRoute (builder: (BuildContext context) => LoginView()),
        ModalRoute.withName('/loginview'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kyty"),),
      body: Center(
        child:
        celdasOLista(bIsList),
      ),
      bottomNavigationBar: BottomMenu(events: onBottomMenuPressed),

      drawer: DrawerClass(onItemTap: eventoDrawerClass),
    );
  }
}
