import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Adddata extends StatefulWidget {
  const Adddata({super.key});

  @override
  State<Adddata> createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  Future<void> Adddata() async {
    print("hello");
    // FirebaseFirestore.instance
    //     .collection("Added_data")
    //     .add({"name": "Anjana", "age": 21});
    // print("succesfully");

    FirebaseFirestore.instance
        .collection("Add_data")
        .add({"name": namectrl.text,"age":agectrl.text});
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
            ElevatedButton(onPressed: () => Adddata(), child: Text("Add data"))
          ],
        )
      ],
    ));
  }
}
