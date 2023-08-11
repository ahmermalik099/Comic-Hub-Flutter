// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;


class ApiService {

  // https://comicvine.gamespot.com/api/characters/?api_key=90247dfc77b56061f5139d4f8a43721cd458cdb2&format=json&limit=2
  final String API_KEY = '90247dfc77b56061f5139d4f8a43721cd458cdb2';
  final String BASE_URL = 'https://comicvine.gamespot.com/api';

  Future<http.Response> getCharacters() async {
    var url = Uri.parse('$BASE_URL/characters/?api_key=$API_KEY&format=json&limit=20');

    
    return await http.get(url);
  }

}