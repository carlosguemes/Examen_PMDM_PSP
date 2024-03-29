import 'package:examen_carlos_guemes/OnBoarding/HomeView.dart';
import 'package:examen_carlos_guemes/OnBoarding/PostCreateView.dart';
import 'package:examen_carlos_guemes/OnBoarding/SplashView.dart';
import 'package:flutter/material.dart';

import 'OnBoarding/LoginView.dart';
import 'OnBoarding/PostView.dart';
import 'OnBoarding/RegisterView.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        routes: {
          '/registerview': (context) => RegisterView(),
          '/loginview': (context) => LoginView(),
          '/splashview': (context) => SplashView(),
          '/homeview': (context) => HomeView(),
          '/postview': (context) => PostView(),
          '/postcreateview': (context) => PostCreateView()
        },
        initialRoute: '/homeview',
      );
    }

}