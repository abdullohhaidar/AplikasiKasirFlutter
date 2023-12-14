import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class HistoryUser extends StatefulWidget {
  @override
  State<HistoryUser> createState() => _HistoryUserState();
}

final String url = 'http://192.168.61.184:8000/api/trans';

Future getTransaction() async {
  var response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

class _HistoryUserState extends State<HistoryUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getTransaction(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: (snapshot.data as dynamic)['data'].length,
                    itemBuilder: (context, index) {
                      final namaTransaksi =
                          snapshot.data['data'][index]['nama_transaksi'];
                      final jumlahTransaksi =
                          snapshot.data['data'][index]['jumlah_item'];
                      String jumlah = jumlahTransaksi.toString();
                      final totalTransaksi =
                          snapshot.data['data'][index]['total_transaksi'];
                      String total = totalTransaksi.toString();
                      return GestureDetector(
                        child: ListTile(
                          title: Text(namaTransaksi),
                          subtitle: Text("Item : ${jumlah}"),
                          trailing: Text("Rp. ${total}"),
                        ),
                      );
                    });
              } else {
                return Text('Data error');
              }
            }));
  }
}
