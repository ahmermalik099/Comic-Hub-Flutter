// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;


class ApiService {

  // https://comicvine.gamespot.com/api/characters/?api_key=90247dfc77b56061f5139d4f8a43721cd458cdb2&format=json&limit=2
  final String API_KEY = '90247dfc77b56061f5139d4f8a43721cd458cdb2';
  final String BASE_URL = 'https://comicvine.gamespot.com/api';

  Future<http.Response> getCharacters() async {
    var url = Uri.parse('$BASE_URL/characters/?api_key=$API_KEY&format=json');

    
    return await http.get(url);
  }

  //teams
  Future<http.Response> getTeams() async {
    var url = Uri.parse('$BASE_URL/teams/?api_key=$API_KEY&format=json');

    return await http.get(url);
  }

  //issues
  Future<http.Response> getIssues() async {
    var url = Uri.parse('$BASE_URL/issues/?api_key=$API_KEY&format=json');

    return await http.get(url);
  }
  //Series
  Future<http.Response> getSeries() async {
    var url = Uri.parse('$BASE_URL/series_list/?api_key=$API_KEY&format=json');

    return await http.get(url);
  }

  //Movies
  Future<http.Response> getMovies() async {
    var url = Uri.parse('$BASE_URL/movies/?api_key=$API_KEY&format=json');

    return await http.get(url);
  }

  Future<http.Response> getSearch(s) async {
    var url = Uri.parse('$BASE_URL/search/?api_key=$API_KEY&format=json&query=$s');

    return await http.get(url);
  }
}