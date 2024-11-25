import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BiodataUpdate.dart';
import 'Biodataview.dart';

class Biodatalist extends StatefulWidget {
  const Biodatalist({super.key});

  @override
  State<Biodatalist> createState() => _BiodatalistState();
}

class _BiodatalistState extends State<Biodatalist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue[100],
      appBar: AppBar(backgroundColor: Colors.blue[100],
          title: Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Text(
              "Bio Data",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo),
            ),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: StreamBuilder(
              stream:
              FirebaseFirestore.instance.collection("MY_bio").snapshots(),
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
                                return Biodataupdate(id:Tudo[index].id);
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
                              .collection("MY_bio")
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
                    return Biodataview();
                  },
                ));
              },
            ),
          ),
        ]));
  }
}
