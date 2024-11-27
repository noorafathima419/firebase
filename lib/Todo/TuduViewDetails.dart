import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tuduviewdetails extends StatefulWidget {
  const Tuduviewdetails({super.key,required this.id});
  final id;

  @override
  State<Tuduviewdetails> createState() => _TuduviewdetailsState();
}

class _TuduviewdetailsState extends State<Tuduviewdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("MY_todo")
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
            final tudodatails = snapshot.data!.data() as Map<String, dynamic>;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      tudodatails["name"] ?? "no data found",
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
                      tudodatails["age"],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )
                  ],
                )
              ],
            );
          },
        ));
  }
}
