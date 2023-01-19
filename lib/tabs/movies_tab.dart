import 'package:flutter/material.dart';
import 'package:flutter_bloc_rxdart_example/blocs/movie.bloc.dart';

import '../models/movie.dart';

class MoviesTab extends StatelessWidget {
  const MoviesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: moviesBloc.allMovies,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return _movieList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

Widget _movieList(AsyncSnapshot<ApiMovieResponse> snapshot) {
  return GridView.builder(
      itemCount: snapshot.data!.results!.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final String? path = snapshot.data?.results?[index]?.posterPath;
        final String url = "https://image.tmdb.org/t/p/w185$path";
        return Image.network(url, fit: BoxFit.cover);
      });
}
