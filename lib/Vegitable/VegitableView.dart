import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Vegitable/VegitableViewDetails.dart';
import 'package:firebase/Vegitable/vegitableupdate.dart';
import 'package:firebase/Vegitable/VegitableAddData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vegitablelist extends StatefulWidget {
  const Vegitablelist({super.key});

  @override
  State<Vegitablelist> createState() => _VegitablelistState();
}

class _VegitablelistState extends State<Vegitablelist> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Product List'),
      ),
      body: Column(
        children: [
          // Search TextField
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Product',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase(); // Update search query
                });
              },
            ),
          ),
          Expanded(
            // StreamBuilder to fetch data
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('My_Vegitable').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No products found.'));
                }

                // Filter products based on search query
                final filteredProducts = snapshot.data!.docs.where((doc) {
                  final productName = doc['name'].toString().toLowerCase();
                  return productName.contains(searchQuery);
                }).toList();

                return ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(product['image'] ?? ''),
                      ),
                      title: Text(product['name']),
                      subtitle: Text('\$${product['price']}'),
                    );
                  },
                );
              },
            ),
          ),Padding(
            padding: EdgeInsets.only(left: 250),
            child: FloatingActionButton(
              shape: CircleBorder(side: BorderSide(width: 1)),
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Vegitableview();
                  },
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
