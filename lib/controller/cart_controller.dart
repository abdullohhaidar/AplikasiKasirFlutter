import 'package:aplikasi_kasir/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'http://192.168.72.184:8000/api/products';

class CartController extends GetxController {
  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  var _products = {}.obs;


  void addProduct(product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
      "Produk Telah Ditambahkan",
      "Kamu Telah Menambahkan Produk ke Keranjang",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  

  get products => _products;
}
