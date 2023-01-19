import 'package:flutter_bloc_rxdart_example/repositories/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import '../models/post.dart';

class PostBloc {
  final _repository = Repository();
  final _postsFetcher = PublishSubject<List<Post>>();

  Stream<List<Post>> get allPost => _postsFetcher.stream;

  fetchAllPost() async {
    final response = await _repository.postApiProvider.fetchPostList();
    _postsFetcher.sink.add(response);
  }

  dispose() {
    _postsFetcher.close();
  }
}

final postBloc = PostBloc();
