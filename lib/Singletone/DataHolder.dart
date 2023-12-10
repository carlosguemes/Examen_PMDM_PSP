import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../FirestoreObjects/FbPost.dart';
import 'FirebaseAdmin.dart';

class DataHolder{
  String sNombre = "Examen";
  FbPost? selectedPost;

  static final DataHolder _dataHolder = new DataHolder._internal();
  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAdmin fa = FirebaseAdmin();

  factory DataHolder(){
    return _dataHolder;
  }

  DataHolder._internal(){
    initCachedFbPost();
  }

  void saveSelectedPostInCache() async{
    if (selectedPost!=null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('titulo', selectedPost!.titulo);
      prefs.setString('cuerpo', selectedPost!.cuerpo);
    }
  }

  Future<FbPost?> initCachedFbPost() async{
    if (selectedPost!=null) return selectedPost;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? titulo = prefs.getString('titulo');
    titulo??="";

    String? cuerpo = prefs.getString('cuerpo');
    cuerpo??="";

    selectedPost=FbPost(titulo: titulo, cuerpo: cuerpo);

    return selectedPost;
  }




}