import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Todo/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tudo_update.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("MY_todo").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("no data found"));
                }
                var Tudo = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: Tudo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return TudoUpdate(id:Tudo[index].id);
                              },
                            ));
                          },
                          icon: Icon(Icons.edit)),
                      title: Text(
                        Tudo[index]["name"],
                      ),subtitle: Text(Tudo[index]["age"]),
                      leading: IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("MY_todo")
                              .doc(Tudo[index].id)
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
                    return Page2();
                  },
                ));
              },
            ),
          ),
        ]));
  }
}
