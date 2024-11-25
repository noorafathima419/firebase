import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Biodataview extends StatefulWidget {
  const Biodataview({super.key});

  @override
  State<Biodataview> createState() => _BiodataviewState();
}

class _BiodataviewState extends State<Biodataview> {
  Future<void> Biodata() async {
    print("hello");

    FirebaseFirestore.instance.collection("MY_bio").add({
      "name": namectrl.text,
      "age": agectrl.text,
      "place": placectrl.text,
      "pin": pinctrl.text,
      "date": datectrl.text,
      "time": timectrl.text,
      "gender": genderctrl.text,
      "contact": contactctrl.text
    });
    Navigator.of(context).pop();
  }

  final form_key = GlobalKey<FormState>();
  TextEditingController namectrl = TextEditingController();
  TextEditingController agectrl = TextEditingController();
  TextEditingController placectrl = TextEditingController();
  TextEditingController pinctrl = TextEditingController();
  TextEditingController datectrl = TextEditingController();
  TextEditingController timectrl = TextEditingController();
  TextEditingController genderctrl = TextEditingController();
  TextEditingController contactctrl = TextEditingController();

  String _selectedValue = 'male';
  String _selectedValue1 = 'Female';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                controller: namectrl,
                decoration: InputDecoration(
                    hintText: "name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
              child: TextFormField(
                controller: agectrl,
                decoration: InputDecoration(
                    hintText: "age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextFormField(
                controller: placectrl,
                decoration: InputDecoration(
                    hintText: "place",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
              child: TextFormField(
                controller: pinctrl,
                decoration: InputDecoration(
                    hintText: "pin",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextFormField(
                controller: datectrl,
                decoration: InputDecoration(
                    hintText: "date",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
              child: TextFormField(
                controller: timectrl,
                decoration: InputDecoration(
                    hintText: "time",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.shade500, width: 2)),
                    child: Column(
                      children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Gender:",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "male",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 1,
                                ),
                                child: Radio<String>(
                                  value: 'male',
                                  groupValue: _selectedValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedValue = value!;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Female",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: Radio<String>(
                                      value: 'Female',
                                      groupValue: _selectedValue,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedValue = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextFormField(
                controller: contactctrl,
                decoration: InputDecoration(
                    hintText: "contact",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.black))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 160),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () => Biodata(), child: Text("Bio data"))
                ],
              ),
            )
          ],
        ));
  }
}
