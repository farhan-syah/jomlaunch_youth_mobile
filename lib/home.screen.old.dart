import 'package:flutter/material.dart';
import 'package:webinar_23_jul/service/product.service.dart';
import 'package:webinar_23_jul/widget/product_container.widget.dart';

import 'model/product.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  List<Product> filteredProducts = [];
  _HomeScreenState() {
    fetchProducts();
  }

  fetchProducts() async {
    try {
      products = await getProducts();
      filteredProducts = products;
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  filter(String keyword) {
    filteredProducts = products
        .where((product) =>
            product.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filter(value);
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, i) {
                Product product = filteredProducts[i];
                return ProductContainer(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
