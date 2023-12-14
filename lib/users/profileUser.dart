import 'package:flutter/material.dart';

class ProfileUser extends StatefulWidget {
  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Profile"),
      ),
      body: Center(
        child: Text(
          'User Page',
          ),
      ),
    );
  }
}
