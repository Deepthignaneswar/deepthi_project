import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Orders Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
