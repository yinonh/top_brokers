import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';

class BrokersListScreen extends StatelessWidget {
  const BrokersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(ConstantStrings.brokersListTitle)),
      body: const Center(child: Text('Brokers List Screen - Placeholder')),
    );
  }
}
