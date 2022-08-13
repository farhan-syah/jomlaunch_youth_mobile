import 'package:flutter/material.dart';
import 'package:webinar_23_jul/service/product.service.dart';

import 'model/product.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];

  _HomeScreenState() {
    fetchProducts();
  }

  fetchProducts() async {
    try {
      products = await getProducts();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          Product product = products[i];
          return Text(product.title);
        },
      ),
    );
  }
}
