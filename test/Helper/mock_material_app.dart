import 'package:flutter/material.dart';

class MockMaterialApp extends StatelessWidget {
  final Widget body;
  const MockMaterialApp({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: body,
      ),
    );
  }
}
