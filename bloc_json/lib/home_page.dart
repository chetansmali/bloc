import 'package:bloc_json/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FetchPostsEvent());

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC API Example'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            final posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: Text('Press the button to fetch posts.'));
          }
        },
      ),
    );
  }
}
