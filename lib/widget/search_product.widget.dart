import 'package:flutter/material.dart';

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: const TextField(),
    );
  }
}
