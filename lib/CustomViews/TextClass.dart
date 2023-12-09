import 'package:flutter/material.dart';

class TextClass extends StatelessWidget{
  TextEditingController controlador;
  String labelText;
  bool esContrasenya;


  TextClass({
    required this.controlador,
    required this.labelText,
    required this.esContrasenya
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: Checkbox.width, vertical: 5),
      child: Flexible(
          child: SizedBox(width: 400,
            child: TextFormField(
              controller: controlador,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                //hintText: 'Input Password',
                labelText: labelText,
                fillColor: Colors.white,
                filled: true,
              ),
              obscureText: esContrasenya,
            ),
          )
      ),
    );
  }
}