import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fruitview extends StatefulWidget {
  const Fruitview({super.key});

  @override
  State<Fruitview> createState() => _FruitviewState();
}

class _FruitviewState extends State<Fruitview> {
  @override
  Future<void> Fruit() async {
    print("hello");

    FirebaseFirestore.instance.collection("Fruit").add({
      "name": namectrl.text,
      "price": pricectrl.text,
      "image": imagectrl.text
    });
    Navigator.of(context).pop();
  }

  final form_key = GlobalKey<FormState>();
  TextEditingController namectrl = TextEditingController();
  TextEditingController pricectrl = TextEditingController();
  TextEditingController imagectrl = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w700),
                controller: namectrl,
                decoration: InputDecoration(
                    hintText: "name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40, top: 10),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w700),
                controller: pricectrl,
                decoration: InputDecoration(
                    hintText: "price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 130),
                  child: ElevatedButton(
                      onPressed: () => Fruit(),
                      child: Text(
                        "submit",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )),
                )
              ],
            )
          ],
        ));
  }
}