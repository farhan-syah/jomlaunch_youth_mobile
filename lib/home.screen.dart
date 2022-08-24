import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webinar_23_jul/data/product.repository.dart';
import 'package:webinar_23_jul/widget/product_container.widget.dart';

import 'model/product.model.dart';

class HomeScreen extends StatelessWidget {
  List<Product> products = [];
  List<Product> filteredProducts = [];
  _HomeScreenState() {
    // fetchProducts();
  }

  // fetchProducts() async {
  //   try {
  //     products = await getProducts();
  //     filteredProducts = products;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // filter(String keyword) {
  //   filteredProducts = products
  //       .where((product) =>
  //           product.title.toLowerCase().contains(keyword.toLowerCase()))
  //       .toList();
  // }

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
                // filter(value);
              },
            ),
          ),
          Consumer(builder: ((context, ref, child) {
            final list = ref.watch(productListProvider);
            return list.when(
                data: ((list) => Expanded(
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, i) {
                          Product product = list[i];
                          return ProductContainer(product: product);
                        },
                      ),
                    )),
                error: ((error, stackTrace) => Container()),
                loading: () => const CircularProgressIndicator());
          })),
        ],
      ),
    );
  }
}
