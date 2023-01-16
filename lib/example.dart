import 'package:flutter/material.dart';
import 'package:flutter_bloc_rxdart_example/blocs/movie-bloc.dart';

import 'models/movie.dart';

class Example extends StatelessWidget {
  final String title;
  const Example({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: StreamBuilder(
          stream: bloc.allMovies,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return movieList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ));
  }
}

Widget movieList(AsyncSnapshot<ApiMovieResponse> snapshot) {
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
