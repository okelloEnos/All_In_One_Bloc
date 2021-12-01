import 'package:flutter/material.dart';

class NetworkCallsScreen extends StatelessWidget {
  const NetworkCallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Network Call'),),
      body: const Center(child: Text('Network Calls Screen')),
    );
  }
}
