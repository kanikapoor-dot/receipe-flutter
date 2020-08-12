import 'package:http/http.dart' as http;
import 'package:receipe/constants.dart';
import 'dart:convert';

class NetworkRequest {
  NetworkRequest({this.recipeName});
  final String recipeName;

  Future getData() async {
    http.Response response = await http.get('$kApiKey&q=$recipeName');
    try {
      if(response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['hits'];
      } else {
        print(response.statusCode);
      }
    }
    catch(e) {
      print(e);
    }
  }

}

