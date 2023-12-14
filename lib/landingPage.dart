import 'dart:async';

import 'package:aplikasi_kasir/loginUser.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_kasir/users/firstPage.dart' as users;

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}



class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  @override
  void dispose() {
    super.dispose();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 6);
    return new Timer(duration, () { 
      Navigator.of(context)
      .pushReplacement(new MaterialPageRoute(builder: (_){
        return new LoginUser();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body : Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/gambar/splash.jpg"),
          fit: BoxFit.cover,
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.2),
              Colors.amber.withOpacity(0.4),
              ],
              stops: [0.0, 1],
              begin: Alignment.topCenter,
              )
        ),
        
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 300.0,
            margin: EdgeInsets.only(top: 200.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.red.withOpacity(0),
                ]
              )
            ),
            child: Text(
              " Welcome to\n My Store",
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ),
      ),
     )
   );
  }
}
