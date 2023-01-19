import 'dart:async';
import 'package:flutter_bloc_rxdart_example/models/post.dart';
import 'package:http/http.dart' show Client;

class PostApiProvider {
  final Client _http = Client();

  Future<List<Post>> fetchPostList() async {
    final response = await _http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      throw Exception("Failed to load post");
    }
  }
}
