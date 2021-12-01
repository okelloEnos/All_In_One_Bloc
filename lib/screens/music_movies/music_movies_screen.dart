import 'package:flutter/material.dart';

class MoviesMusicScreen extends StatelessWidget {
  const MoviesMusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Movies & Music'),),
      body: const Center(child: Text('Movies & Music Screen')),
    );
  }
}
