
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: message == "تم التسجيل بنجاح" ? Colors.green : Colors.red,
    content: Text(message),

  ));
}
