import 'package:aplikasi_kasir/users/cartUser.dart';
import 'package:aplikasi_kasir/users/historyUser.dart';
import 'package:aplikasi_kasir/users/home/homeUser.dart';
import 'package:aplikasi_kasir/users/profileUser.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new HomeUser(),
    new CartUser(),
    new HistoryUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.home,
              color: Colors.amber,
            ),
            icon: new Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.shopping_bag,
              color: Colors.grey,
            ),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.person,
              color: Colors.amber,
            ),
            icon: new Icon(
              Icons.history_edu,
              color: Colors.grey,
            ),
            label: 'Transaksi',
          ),
        ],
      ),
    );
  }
}
