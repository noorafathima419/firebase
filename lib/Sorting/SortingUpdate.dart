import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sortingupdate extends StatefulWidget {
  const Sortingupdate({super.key,required this.id});
  final id;

  @override
  State<Sortingupdate> createState() => _SortingupdateState();
}

class _SortingupdateState extends State<Sortingupdate> {
  @override
  Widget build(BuildContext context) {

    TextEditingController namectrl = TextEditingController();
    TextEditingController pricectrl = TextEditingController();


    return  Scaffold(body: Column(
      children: [
        TextFormField(
          controller: namectrl,
          decoration: InputDecoration(
              hintText: "name",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2, color: Colors.black))),
        ),
        TextFormField(
          controller: pricectrl,
          decoration: InputDecoration(
              hintText: "price",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2, color: Colors.black))),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore.instance
                      .collection("My_Shoping")
                      .doc(widget.id)
                      .update({"name": namectrl.text, "price": pricectrl.text});
                  Navigator.of(context).pop();
                },
                child: Text("Update"))
          ],
        )
      ],
    ));
  }
}
