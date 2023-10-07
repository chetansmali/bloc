import 'dart:convert';
import 'package:bloc_todo_json/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  final String APIURl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodo() async {
    final res =await http.get(Uri.parse(APIURl));
    if(res.statusCode == 200){
      final List<dynamic> data = json.decode(res.body);
      return data.map((e) => TodoModel.fromJson(e)).toList();
    }else{
      throw Exception('Cannot load the data from server');
    }
  }
}