import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http_response/repository/user_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  UserRepository repository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () async {
              var response = await repository.getAllUser();

              print(response.data);
            },
            child: Text("Fetch"),
          ),
        ),
      ),
    );
  }
}
