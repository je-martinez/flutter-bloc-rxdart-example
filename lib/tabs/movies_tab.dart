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
          return _MovieList(
            snapshot: snapshot,
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}

class _MovieList extends StatelessWidget {
  final AsyncSnapshot<ApiMovieResponse> snapshot;
  const _MovieList({required this.snapshot});

  @override
  Widget build(BuildContext context) {
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
}
