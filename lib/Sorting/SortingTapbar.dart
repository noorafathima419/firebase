import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Fruit.dart';
import 'Growcery.dart';
import 'Vegitable.dart';

class Sortingtapbar extends StatefulWidget {
  const Sortingtapbar({super.key});

  @override
  State<Sortingtapbar> createState() => _SortingtapbarState();
}

class _SortingtapbarState extends State<Sortingtapbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shopping'),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.indigoAccent,
            ),
            tabs: [
              Tab(
                child: Text(
                  'VEGETABLES',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'FRUITS',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'GROCERY',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Vegitable(), // Call the first class
            Fruit(),
            Growcery()
            // Call the second class
          ],
        ),
      ),
    );}}