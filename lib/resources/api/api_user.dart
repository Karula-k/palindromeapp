import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:palindromeapp/model/user.dart';

class ApiService {
  static const _baseUrl = "https://reqres.in/api";
  static const _apiList = "/users";

  Client client = Client();

  //Getting list from API
  Future<Header> userlist(int page, int perPage) async {
    final _queryparam = {
      'page': page.toString(),
      'per_page': perPage.toString()
    };

    String uri = Uri(queryParameters: _queryparam).query;
    var endpoint = _baseUrl + _apiList + "?" + uri;
    final response = await client.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return Header.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed to fetch api");
    }
  }
}
