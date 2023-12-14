import 'package:flutter/material.dart';
import 'package:aplikasi_kasir/users/firstPage.dart' as users;

class LoginUser extends StatefulWidget {
  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/gambar/splash.jpg"),
        fit: BoxFit.cover,
      )),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.2),
            Colors.amber.withOpacity(0.4),
          ],
          stops: [0.0, 1],
          begin: Alignment.topCenter,
        )),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 400.0,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Colors.red.withOpacity(0),
            ])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(child: _page()),
            ),
          ),
        ),
      ),
    ));
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(
              height: 50,
            ),
            _inputUsernameField(),
            const SizedBox(
              height: 20,
            ),
            _inputPasswordField(),
            const SizedBox(
              height: 50,
            ),
            _loginBtn(context),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _icon() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle),
    child: const Icon(
      Icons.person,
      color: Colors.white,
      size: 120,
    ),
  );
}

Widget _inputUsernameField() {
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white));

  return TextField(
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: "Username",
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: border,
      focusedBorder: border,
    ),
  );
}

Widget _inputPasswordField() {
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white));

  return TextField(
    
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: "Password",
      hintStyle: const TextStyle(color: Colors.white),
      enabledBorder: border,
      focusedBorder: border,
    ),
  );
}

Widget _loginBtn(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/home');
    },
    child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign In",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        )),
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      primary: Color.fromARGB(225, 225, 226, 226),
      onPrimary: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
  );
}
