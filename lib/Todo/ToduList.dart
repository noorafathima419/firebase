import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Todo/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tudo_update.dart';
import 'TuduViewDetails.dart';

class Todulist extends StatefulWidget {
  const Todulist({super.key});

  @override
  State<Todulist> createState() => _TodulistState();
}

class _TodulistState extends State<Todulist> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),
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
                    return InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Tuduviewdetails(id: Tudo[index].id,);
                      },));
                    },
                      child: ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return TudoUpdate(id: Tudo[index].id);
                                },
                              ));
                            },
                            icon: Icon(Icons.edit)),
                        title:
                          Row(
                            children: [Text(
                              Tudo[index]["name"],
                            ),
                                                ]
                          ),

                        leading: IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("MY_todo")
                                .doc(Tudo[index].id)
                                .delete();
                          },
                          icon: Icon(Icons.delete),
                        ),
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
