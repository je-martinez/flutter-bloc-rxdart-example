import 'package:flutter/material.dart';
import 'package:flutter_bloc_rxdart_example/blocs/post.bloc.dart';

import '../models/post.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: postBloc.allPost,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return _PostList(snapshot.data);
          } else if (snapshot.hasError) {
            return const Text("Failed to load posts");
          }
          return const CircularProgressIndicator();
        }));
  }
}

class _PostList extends StatelessWidget {
  final List<Post>? posts;
  const _PostList(this.posts);

  @override
  Widget build(BuildContext context) {
    if (posts == null || posts?.isEmpty == true) {
      return const Text("No post available");
    }

    return ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(posts?[index].title ?? ''),
              ),
              const Divider()
            ],
          );
        });
  }
}
