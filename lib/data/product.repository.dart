import 'package:riverpod/riverpod.dart';
import 'package:webinar_23_jul/service/product.service.dart';

import '../model/product.model.dart';

final productListProvider = FutureProvider.autoDispose<List<Product>>((ref) {
  return getProducts();
});
