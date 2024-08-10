import 'package:http/http.dart' as http;
import 'dart:convert';

class Getapi {
  final String UrlApi = 'https://reqres.in/api/users';

  //Get Data dari API
  Future<Map<String, dynamic>> fetchUsers(
      {int page = 1, int perPage = 10}) async {
    final response =
        await http.get(Uri.parse('$UrlApi?page=$page&per_page=$perPage'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
