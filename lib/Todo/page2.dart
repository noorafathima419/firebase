import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future<void> Tudo() async {
    print("hello");
    // FirebaseFirestore.instance
    //     .collection("Added_data")
    //     .add({"name": "Anjana", "age": 21});
    // print("succesfully");

    FirebaseFirestore.instance
        .collection("MY_todo")
        .add({"name": namectrl.text, "age": agectrl.text});
    Navigator.of(context).pop();
  }

  final form_key = GlobalKey<FormState>();
  TextEditingController namectrl = TextEditingController();
  TextEditingController agectrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
          controller: agectrl,
          decoration: InputDecoration(
              hintText: "age",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 2, color: Colors.black))),
        ),
        Row(
          children: [
            ElevatedButton(onPressed: () => Tudo(), child: Text("submit"))
          ],
        )
      ],
    ));
  }
}
