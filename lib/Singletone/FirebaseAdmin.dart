import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAdmin{

  void onClickRegistrar (TextEditingController usernameController,
      TextEditingController passwordController,
      TextEditingController repasswordController) async{

    if (passwordController.text == repasswordController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
        //Navigator.of(_context).popAndPushNamed('/homeview');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    else{
      print('Las contraseñas tienen que ser iguales');
    }
  }


  void onClickLogin(TextEditingController tecUsername,
      TextEditingController tecPassword) async{

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: tecUsername.text,
        password: tecPassword.text,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


}