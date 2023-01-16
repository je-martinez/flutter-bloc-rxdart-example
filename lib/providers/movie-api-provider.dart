import 'dart:async';
import 'package:flutter_bloc_rxdart_example/models/movie.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = "802b2c4b88ea1183e50e6b285a27696e";

  Future<ApiMovieResponse> fetchMovieList() async {
    final response = await client.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ApiMovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
