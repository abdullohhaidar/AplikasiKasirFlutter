import 'dart:convert';
import 'package:aplikasi_kasir/controller/cart_controller.dart';
import 'package:aplikasi_kasir/users/cartUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../constans.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:convert';
import '../../models/kategori.dart';
import 'package:get/get.dart';
import "package:fluttertoast/fluttertoast.dart";

import '../../models/product_model.dart';

class Beranda extends StatefulWidget {
  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  // List<Kategori> kategorilist = [];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchKategori();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   kategorilist = null;
  // }

  // Future<List<Kategori>> fetchKategori() async {
  //   List<Kategori> usersList;
  //   var params = "/kategoribyproduk";
  //   try {
  //     var jsonResponse = await http.get((Palette.sUrl + params) as Uri);
  //     if (jsonResponse.statusCode == 200) {
  //       final jsonItems =
  //           json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

  //       usersList = jsonItems.map<Kategori>((json) {
  //         return Kategori.fromJson(json);
  //       }).toList();

  //       setState(() {
  //         kategorilist = usersList;
  //       });
  //     }
  //   } catch (e) {
  //     usersList = kategorilist;
  //   }
  //   return usersList;
  // }

  // Future<Null> _refresh() {
  //   return fetchKategori().then((_kategori) {});
  // }

  Future<void> addToCart(
      String nama_produk,
      String deskripsi_produk,
      String image_produk,
      String harga_produk,
      String jumlah,
      String jumlah_harga) async {
    const String apiUrl = 'http://192.168.61.184:8000/api/carts';

    final response = await http.post(Uri.parse(apiUrl), body: {
      'nama_cart': nama_produk,
      'deskripsi_cart': deskripsi_produk,
      'image_url_cart': image_produk,
      'harga_cart': harga_produk,
      'jumlah': jumlah,
      'jumlah_harga': jumlah_harga,
    });
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body.replaceAll('<br />', ''));
      if (responseData['status'] == 'successs') {
        print("Data Berhasil Dikirim");
      } else {
        print("Gagal Mengirim Data: ${responseData['message']}");
      }
    } else {
      print("Error : ${response.statusCode}");
    }
  }

  final cartController = Get.put(CartController());

  final String url = 'http://192.168.61.184:8000/api/products';

  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.amber,
        body: FutureBuilder(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: (snapshot.data as dynamic)['data'].length,
                    itemBuilder: (context, index) {
                      final namaProduk = snapshot.data['data'][index]['nama'];
                      final deskripsiProduk =
                          snapshot.data['data'][index]['deskripsi'];
                      final imageProduk =
                          snapshot.data['data'][index]['image_url'];
                      final hargaProduk = snapshot.data['data'][index]['harga'];
                      final jumlah = "1";
                      final jumlahHarga = snapshot.data['data'][index]['harga'];
                      return GestureDetector(
                        onTap: () {
                          cartController
                              .addProduct(snapshot.data['data'][index]['data']);
                          addToCart(namaProduk, deskripsiProduk, imageProduk,
                              hargaProduk, jumlah, jumlahHarga);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartUser()));
                        },
                        child: ListTile(
                          title: Text(namaProduk),
                          subtitle: Text(deskripsiProduk),
                          leading: Image.network(imageProduk),
                          trailing: Text("Rp.${hargaProduk}"),
                        ),
                      );
                    });
              } else {
                return Text('Data error');
              }
            }));
  }
}
