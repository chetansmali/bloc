part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class FetchPostsEvent extends PostEvent {}
