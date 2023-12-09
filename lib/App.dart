import 'package:flutter/material.dart';

import 'OnBoarding/RegisterView.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        routes: {
          '/registerview': (context) => RegisterView(),
        },
        initialRoute: '/registerview',
      );
    }

}