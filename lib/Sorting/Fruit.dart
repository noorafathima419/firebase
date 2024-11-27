import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SortingAddData.dart';
import 'SortingUpdate.dart';

class Fruit extends StatefulWidget {
  const Fruit({super.key});

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("My_Shoping")
                  .where("Cattegory", isEqualTo: "Fruit")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("no data found"));
                }
                var Sort = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: Sort.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Sortingupdate(id: Sort[index].id);
                              },
                            ));
                          },
                          icon: Icon(Icons.edit)),
                      title: Text(
                        Sort[index]["name"],
                      ),
                      subtitle: Text(Sort[index]["price"]),
                      leading: IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("My_Shoping")
                              .doc(Sort[index].id)
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
                    return Sortingadddata();
                  },
                ));
              },
            ),
          ),
        ]));
  }
}
