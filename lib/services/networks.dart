import 'package:http/http.dart' as http;
import 'package:receipe/constants.dart';
import 'dart:convert';

class NetworkRequest {
  NetworkRequest({this.recipeName});
  final String recipeName;

  Future<http.Response> getData() async {
    http.Response response =await http.get('$kApiKey&q=$recipeName');
    if(response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(data));
    } else {
      print(response.statusCode);
    }
  }

}

