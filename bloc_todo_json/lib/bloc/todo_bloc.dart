import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_todo_json/model/todo_model.dart';
import 'package:bloc_todo_json/repository/todo_repo.dart';
import 'package:meta/meta.dart';

part  'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final _repo = TodoRepository();
  TodoBloc() : super(TodoInitial()) {
    on<FetchTodoEvent>(_dataFetch);
  }

Future<void> _dataFetch(FetchTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try{
      final todo =await _repo.fetchTodo();
      emit(TodoLoaded(todo));
    }
    catch(e){
      emit(TodoError(e.toString()));
    }
}

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {}
}
