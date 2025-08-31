import 'dart:convert';
import 'dart:typed_data';
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

Future<dynamic> uploadFileAPI(
  BuildContext context,
  Uint8List bytes,
  String fileName,
) async {
  try {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("https://api.escuelajs.co/api/v1/files/upload"),
    );
    var multiPartFile = http.MultipartFile.fromBytes(
      "file",
      bytes,
      filename: fileName,
    );
    request.files.add(multiPartFile);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      var data = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(data);
      if (context.mounted) {
        showSnackBar(
          context,
          "UPLOADED AT: ${jsonResponse["location"].toString()}",
          Colors.green,
        );
      }
      return jsonResponse;
    } else {
      return null;
    }
  } catch (e) {
    if (context.mounted) {
      showSnackBar(context, "ERROR: ${e.toString()}", Colors.red);
    }
  }
}
