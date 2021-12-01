import 'package:flutter/material.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Todos Task'),),
      body: const Center(child: Text('Task todo Screen')),
    );
  }
}
