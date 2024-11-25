import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TudoUpdate extends StatefulWidget {
  const TudoUpdate({super.key, required this. id});
 final id;
  @override
  State<TudoUpdate> createState() => _TudoUpdateState();
}

class _TudoUpdateState extends State<TudoUpdate> {
  @override
  Widget build(BuildContext context) {


    TextEditingController namectrl = TextEditingController();
    TextEditingController agectrl = TextEditingController();

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
            ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore.instance
                      .collection("MY_todo")
                      .doc(widget.id)
                      .update({"name": namectrl.text, "age": agectrl.text});
                  Navigator.of(context).pop();
                },
                child: Text("Update"))
          ],
        )
      ],
    ));
  }
}
