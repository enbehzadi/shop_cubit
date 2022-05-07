import 'dart:convert';
import 'package:http/http.dart' as http;
class NetworkService {
  final baseUrl = 'fakestoreapi.com';

  Future<List<dynamic>> fetchPost() async {
    try {
      final uri = Uri.https(baseUrl,'/products');
      final response = await http.get(uri);
      return jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
