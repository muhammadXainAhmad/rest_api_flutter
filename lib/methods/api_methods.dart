import 'dart:convert';
import 'package:rest_api/Models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/photo_model.dart';
import 'package:rest_api/models/user_model/user_model.dart';

Future<List<PostModel>> getPostApi() async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    // CLOUDFLARE BLOCKS REQUESTS WITHOUT HEADERS
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "User-Agent": "Mozilla/5.0 (Android 13; Mobile) FlutterApp",
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    List<PostModel> postList = [];
    for (Map<String, dynamic> i in data) {
      postList.add(PostModel.fromJson(i));
    }
    return postList;
  } else {
    throw Exception("Failed to load post data");
  }
}

Future<List<PhotoModel>> getPhotoAPI() async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/photos"),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<PhotoModel> photosList = [];
    for (Map<String, dynamic> i in data) {
      photosList.add(PhotoModel.fromJson(i));
    }
    return photosList;
  } else {
    throw Exception("Failed to load photos data");
  }
}

Future<List<UserModel>> getUserAPI() async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/users"),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<UserModel> userList = [];
    for (Map<String, dynamic> i in data) {
      userList.add(UserModel.fromJson(i));
    }
    return userList;
  } else {
    throw Exception("Failed to load user data");
  }
}
