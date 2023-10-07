part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todo;
  TodoLoaded(this.todo);
}

class TodoError extends TodoState {
  final String error;
  TodoError(this.error);
}
