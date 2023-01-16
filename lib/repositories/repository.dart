import 'dart:async';
import '../providers/movie-api-provider.dart';
import '../models/movie.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();

  Future<ApiMovieResponse> fetchAllMovies() =>
      movieApiProvider.fetchMovieList();
}
