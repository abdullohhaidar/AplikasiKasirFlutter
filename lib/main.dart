import 'package:aplikasi_kasir/landingPage.dart';
import 'package:aplikasi_kasir/users/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: LandingPage(),
      routes: {
        '/home' : (context) => FirstPage(),
      },
    );
  }
}


