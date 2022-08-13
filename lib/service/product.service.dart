import '../model/product.model.dart';
import '../utils/api.util.dart';

Future<List<Product>> getProducts() async {
  Uri uri = Uri.parse('https://dummyjson.com/products/');
  final result = List.from((await get(uri))['products']);
  return result.map((data) => Product.fromMap(data)).toList();
}

Future<Product> getProduct() async {
  Uri uri = Uri.parse('https://dummyjson.com/products/');
  final result = await get(uri) as Map<String, dynamic>;

  return Product.fromMap(result);
}
