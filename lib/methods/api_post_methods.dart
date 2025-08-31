import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/snackbar.dart';

Future<void> loginPostAPI(
  BuildContext context,
  String username,
  String password,
) async {
  var body = {"username": username, "password": password};
  http.Response response = await http.post(
    Uri.parse("https://dummyjson.com/auth/login"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body),
  );
  if (response.statusCode == 200) {
    Map json = jsonDecode(response.body.toString());
    if (context.mounted) {
      showSnackBar(
        context,
        "LOGIN SUCCESSFUL - ID: ${json["accessToken"]}",
        Colors.green,
      );
    }
  } else {
    if (context.mounted) {
      showSnackBar(context, "ERROR", Colors.red);
    }
  }
}
