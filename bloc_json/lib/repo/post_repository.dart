import 'dart:convert';
import 'package:bloc_json/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  final String _apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(_apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((postJson) => Post.fromJson(postJson)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
