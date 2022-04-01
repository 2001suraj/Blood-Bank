// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class GetData {
  Future getinfo() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var result = await http.get(url);
    print(result.statusCode);
    print(result.body);
    return json.decode(result.body);
  }
}
