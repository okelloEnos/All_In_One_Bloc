import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Counter Screen'),),
      body: const Center(child: Text('Counting Screen')),
    );
  }
}
