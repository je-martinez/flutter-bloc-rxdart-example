import '../repositories/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movie.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ApiMovieResponse>();

  Stream<ApiMovieResponse> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ApiMovieResponse response = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(response);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
