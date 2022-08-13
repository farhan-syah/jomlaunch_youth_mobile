// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../model/product.model.dart';

class ProductContainer extends StatelessWidget {
  final Product product;

  const ProductContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              product.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
        ),
        tileColor: Colors.cyan.shade50,
        title: Text(product.title),
      ),
    );
  }
}
