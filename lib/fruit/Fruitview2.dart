import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fruitview2 extends StatefulWidget {
  const Fruitview2({super.key, required this.id});
  final id;

  @override
  State<Fruitview2> createState() => _Fruitview2State();
}

class _Fruitview2State extends State<Fruitview2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            "FRUIT DETAILS",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.indigo),
          ),
        ),
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("Fruit")
                .doc(widget.id)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("user found"));
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(child: Text("no user data found"));
              }
              final Fruitdetails =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 80),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(Fruitdetails["image"]
                                  ))),
                          width: 200,
                          height: 200,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Fruitdetails["name"] ?? "no data found",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Fruitdetails["price"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  )
                ],
              );
            }));
  }
}
