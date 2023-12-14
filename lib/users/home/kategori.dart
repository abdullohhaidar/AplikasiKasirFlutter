import 'package:flutter/material.dart';

class Kategori extends StatefulWidget {
  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      // backgroundColor: Colors.amber,
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 10.0)),
          ListTile(
            title: Text("Abdulloh Haidar Azzam"),
            subtitle: Text("umur 20 tahun"),
            leading: FlutterLogo(size: 35.0,),
            trailing: Text("20.000"),
          ),
          ListTile(
            title: Text("Abdulloh Haidar Azzam"),
            subtitle: Text("umur 20 tahun"),
            leading: FlutterLogo(size: 35.0,),
            trailing: Text("20.000"),
            
          ),
          ListTile(
            title: Text("Abdulloh Haidar Azzam"),
            subtitle: Text("umur 20 tahun"),
            leading: FlutterLogo(size: 35.0,),
            trailing: Text("20.000"),
          ),
        ],
      ),
    );
  }
}
