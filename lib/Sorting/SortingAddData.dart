import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sortingadddata extends StatefulWidget {
  const Sortingadddata({super.key});

  @override
  State<Sortingadddata> createState() => _SortingadddataState();
}

class _SortingadddataState extends State<Sortingadddata> {
  @override
  Future<void> ADD() async {
    print("hello");

    FirebaseFirestore.instance.collection("My_Shoping").add({
      "name": namectrl.text,
      "price": pricectrl.text,
      "Cattegory": _selectedItem
    });
    print("Suuccesfully");
    Navigator.of(context).pop();
  }

  final form_key = GlobalKey<FormState>();
  TextEditingController namectrl = TextEditingController();
  TextEditingController pricectrl = TextEditingController();

  String _selectedItem = 'Fruit';

  final List<String> _options = [
    'Fruit',
    'Vegitable',
    'Grocery',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Column(children: [
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: _selectedItem,
                items: _options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                    print(_selectedItem);
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 130),
                child: ElevatedButton(
                    onPressed: () => ADD(),
                    child: Text(
                      "submit",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )),
              )
            ],
          ),
        ]));
  }
}
