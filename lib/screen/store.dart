import 'package:firstdart/config/constant.dart';
import 'package:firstdart/screen/Store/adddata.dart';
import 'package:firstdart/screen/Store/viewdata.dart';
import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Store"),
        ),
        body: TabBarView(children: [
          AddData(),
          ViewData(),
        ]),
        bottomNavigationBar: Container(
          color: Colors.amber,
          child: TabBar(
            indicatorColor: Colors.black,
            labelColor: sColor,
            tabs: [
              Tab(
                text: "Add Data",
              ),
              Tab(
                text: "View Data",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
