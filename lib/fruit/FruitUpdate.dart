import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fruitupdate extends StatefulWidget {
  const Fruitupdate({super.key,required this.id});
  final id;

  @override
  State<Fruitupdate> createState() => _FruitupdateState();
}

class _FruitupdateState extends State<Fruitupdate> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namectrl=TextEditingController();
    TextEditingController pricectrl=TextEditingController();
    TextEditingController imagectrl=TextEditingController();

    return  Scaffold(appBar: AppBar(),
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
              controller: pricectrl,
              decoration: InputDecoration(
                  hintText: "price",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black))),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40, top: 10),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w700),
                controller: imagectrl,
                decoration: InputDecoration(
                    hintText: "image",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      FirebaseFirestore.instance
                          .collection("Fruit")
                          .doc(widget.id)
                          .update({
                        "name": namectrl.text,
                        " price": pricectrl.text,
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("Update"))
              ],
            )
          ],
        ));
  }
}
