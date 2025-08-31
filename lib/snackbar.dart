import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, Color clr) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(child: Text(message,style: TextStyle(color: Colors.white),)),
      backgroundColor: clr,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
