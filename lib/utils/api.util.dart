import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> get(Uri url, {Map<String, String>? headers}) async {
  final response = await http.get(url, headers: headers);
  return jsonDecode(response.body);
}
