import 'dart:convert';

import 'package:rest_api/Models/post_model.dart';
import 'package:http/http.dart' as http;

List<PostModel> postList = [];
Future<List<PostModel>> getPostApi() async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  );
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);

    for (Map<String, dynamic> i in data) {
      postList.add(PostModel.fromJson(i));
    }
    return postList;
  } else {
    throw Exception("Failed to load post");
  }
}
