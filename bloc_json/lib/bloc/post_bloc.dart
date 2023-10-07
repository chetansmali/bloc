import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_json/model/post_model.dart';
import 'package:bloc_json/repo/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _repository = PostRepository();

  PostBloc() : super(PostInitial()) {
    on<FetchPostsEvent>(_fetchPosts);
  }

  void _fetchPosts(FetchPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await _repository.fetchPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {}
}
