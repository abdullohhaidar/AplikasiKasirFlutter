import 'package:aplikasi_kasir/users/home/beranda.dart';
import 'package:aplikasi_kasir/users/home/kategori.dart';
import 'package:flutter/material.dart';


class HomeUser extends StatefulWidget {
  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser>
  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _activeTabIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_setActiveTabIndex);
  }

  void _setActiveTabIndex() {
    _activeTabIndex = _tabController.index;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
        appBar: AppBar(
          title: TextField(
            onTap: () {},
            readOnly: true,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: new BorderSide(color: Colors.white),
              ),
              fillColor: Color(0xfff3f3f4),
              filled: true,
            ),
          ),
          
          backgroundColor: Colors.amber,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.amber,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            labelPadding: EdgeInsets.all(0),
            tabs: [
              Tab(text: 'Beranda'),
              Tab(text: 'kategori'),
            ],
          ),
        ),
        body: 
        TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            Beranda(),
            Kategori(),
          ],
        ),
      );
  }
}
