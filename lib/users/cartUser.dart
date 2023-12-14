// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors

import 'package:aplikasi_kasir/controller/cart_controller.dart';
import 'package:aplikasi_kasir/users/historyUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';
import 'dart:convert';

class CartUser extends StatefulWidget {
  @override
  State<CartUser> createState() => _CartUserState();
}

class _CartUserState extends State<CartUser> {
  List<Map<String, dynamic>> cartData = [];
  // final CartController controller = Get.put(CartController());
  int _counter = 0;
  double total = 0;

  addCounter(int idKeranjang, int _counter, double hargaKeranjang) {
    _counter++;
    total = _counter * hargaKeranjang;
    setState(() {
      _counter;
      updateCartItem(idKeranjang, _counter, total);
      getCart();
    });
  }

  removeCounter(int idKeranjang, int _counter, double hargaKeranjang) {
    _counter--;
    total = hargaKeranjang / _counter;
    setState(() {
      _counter;
      updateCartItem(idKeranjang, _counter, total);
      getCart();
    });
  }

  Future hitungTotalTransaksi() async {
    final response =
        await http.get(Uri.parse('http://192.168.61.184:8000/api/total-harga'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['total_harga'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future hitungJumlahTransaksi() async {
    final response =
        await http.get(Uri.parse('http://192.168.61.184:8000/api/total-item'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['total_item'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  final String url = 'http://192.168.61.184:8000/api/carts';

  Future getCart() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future<void> addToTransaction(
    String nama_transaksi,
    String jumlah_transaksi,
    String total_transaksi,
  ) async {
    const String apiUrl = 'http://192.168.61.184:8000/api/trans';

    final response = await http.post(Uri.parse(apiUrl), body: {
      'nama_transaksi': nama_transaksi,
      'jumlah_item': jumlah_transaksi,
      'total_transaksi': total_transaksi,
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

  Future<void> updateCartItem(
      int idKeranjang, int jumlahKeranjang, double hargaKeranjang) async {
    String apiUrl = 'http://192.168.61.184:8000/api/carts/${idKeranjang}';

    var response = await http.put(Uri.parse(apiUrl), body: {
      "jumlah": jumlahKeranjang.toString(),
      "jumlah_harga": hargaKeranjang.toString()
    });
    print(response.body);
    getCart();
    return json.decode(response.body);
  }

  Future<void> deleteCartItem(int idKeranjang) async {
    String apiUrl = 'http://192.168.61.184:8000/api/carts/${idKeranjang}';
    var response = await http.delete(
      Uri.parse(apiUrl),
    );
    print(response.body);
    getCart();
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController namaPelangganController = TextEditingController();
    final totalHarga = hitungTotalTransaksi();
    final totalJumlah = hitungJumlahTransaksi();
    String transaksi = "";
    String jumlahItem = "";
    int totalTransaksi = 325000;
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: FutureBuilder(
                    future: getCart(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount:
                                (snapshot.data as dynamic)['data'].length,
                            itemBuilder: (context, index) {
                              final idCart = snapshot.data['data'][index]['id'];
                              final jumlahProduk =
                                  snapshot.data['data'][index]['jumlah'];
                              int _quantity = jumlahProduk;
                              final namaProduk =
                                  snapshot.data['data'][index]['nama_cart'];
                              final imageProduk = snapshot.data['data'][index]
                                  ['image_url_cart'];
                              final hargaProduk =
                                  snapshot.data['data'][index]['harga_cart'];
                              double total = double.parse(hargaProduk);
                              final jumlahHarga =
                                  snapshot.data['data'][index]['jumlah_harga'];

                              return GestureDetector(
                                onTap: () {
                                  deleteCartItem(idCart);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 100.0,
                                      child: Center(
                                        child: Container(
                                          width: 75.0,
                                          height: 75.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    NetworkImage(imageProduk),
                                                fit: BoxFit.scaleDown),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              width: 120.0,
                                              child: Text(
                                                namaProduk,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    size: 20.0,
                                                  ),
                                                  color: Colors.black,
                                                  onPressed: () {
                                                    addCounter(idCart,
                                                        jumlahProduk, total);
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Text(
                                                  "${_quantity}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.remove_circle,
                                                    size: 20.0,
                                                  ),
                                                  color: Colors.blue,
                                                  onPressed: () {
                                                    removeCounter(idCart,
                                                        jumlahProduk, total);
                                                  },
                                                ),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Rp.${jumlahHarga}",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.0),
                                                  Container(
                                                    child: IconButton(
                                                      icon: Icon(Icons.delete),
                                                      iconSize: 30,
                                                      onPressed: () {
                                                        setState(() {
                                                          deleteCartItem(
                                                              idCart);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        return Text('Data error');
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      FutureBuilder(
                        future: hitungTotalTransaksi(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            final totalTransaksi = snapshot.data;
                            transaksi = totalTransaksi;
                            return Text(
                              "Rp.${totalTransaksi}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Jumlah",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      FutureBuilder(
                        future: hitungJumlahTransaksi(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            final jumlahData = snapshot.data;
                            jumlahItem = jumlahData;
                            return Text(
                              "${jumlahItem}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: namaPelangganController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Masukkan Nama Pembeli',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addToTransaction(namaPelangganController.text,
                    jumlahItem.toString(), transaksi.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryUser()));
              },
              child: const Text("Tambahkan Transaksi"),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(200, 30)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );

    // return SizedBox(
    //   height: 600,
    //   child: ListView.builder(
    //       itemCount: controller.products.lenght,
    //       itemBuilder: (BuildContext context, int index) {
    //         return CartProductCart(
    //           controller: controller,
    //           product: controller.products.keys.tolist()[index],
    //           quantity: controller.products.values.tolist()[index],
    //           Index: index,
    //         );
    //       }),
    // );
  }
}

// class CartProductCart extends StatelessWidget {
//   final CartController controller;
//   final Product product;
//   final int quantity;
//   final int Index;

//   const CartProductCart({
//     Key? key,
//     required this.controller,
//     required this.product,
//     required this.quantity,
//     required this.Index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
