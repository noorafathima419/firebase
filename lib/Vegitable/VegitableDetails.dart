import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Vegitable/VegitableViewDetails.dart';
import 'package:firebase/Vegitable/vegitableupdate.dart';
import 'package:firebase/Vegitable/VegitableAddData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vegitabledetails extends StatefulWidget {
  const Vegitabledetails({super.key});

  @override
  State<Vegitabledetails> createState() => _VegitabledetailsState();
}

class _VegitabledetailsState extends State<Vegitabledetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),
    body: Column(children: [
      Expanded(
        child: StreamBuilder(
          stream:
          FirebaseFirestore.instance.collection("My_Vegitable").snapshots(),
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
                    return Vegitablellist2(id: Tudo[index].id,);
                  },));
                },
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Vegitableupdate(id: Tudo[index].id);
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
                            .collection("My_Vegitable")
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
                return Vegitableview();
              },
            ));
          },
        ),
      ),
    ]));
  }
}
