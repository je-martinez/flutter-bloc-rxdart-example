import 'dart:async';
import 'package:flutter_bloc_rxdart_example/models/post.dart';
import 'package:flutter_bloc_rxdart_example/providers/post_api.provider.dart';

import '../providers/movie_api.provider.dart';
import '../models/movie.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();
  final postApiProvider = PostApiProvider();

  Future<ApiMovieResponse> fetchAllMovies() =>
      movieApiProvider.fetchMovieList();

  Future<List<Post>> fetchAllPost() => postApiProvider.fetchPostList();
}
