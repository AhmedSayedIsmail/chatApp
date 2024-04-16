  import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String messagetext) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messagetext)));
  }
