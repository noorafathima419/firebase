import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FruitUpdate.dart';
import 'FruitView.dart';
import 'Fruitview2.dart';

class Fruitlist extends StatefulWidget {
  const Fruitlist({super.key});

  @override
  State<Fruitlist> createState() => _FruitlistState();
}

class _FruitlistState extends State<Fruitlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Fruit").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("no data found"));
                }
                var Fruit = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: Fruit.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Fruitupdate(id: Fruit[index].id);
                              },
                            ));
                          },
                          icon: Icon(Icons.edit)),
                      title: InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Fruitview2(id: Fruit[index].id,);
                        },));
                      },
                        child: Text(
                          Fruit[index]["name"],
                        ),
                      ),
                      leading: IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("Fruit")
                              .doc(Fruit[index].id)
                              .delete();
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 250),
            child: FloatingActionButton(
              shape: CircleBorder(side: BorderSide(width: 1)),
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Fruitview();
                  },
                ));
              },
            ),
          ),
        ]));
  }
}
