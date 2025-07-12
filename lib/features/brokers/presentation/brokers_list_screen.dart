import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';

class BrokerDetailsScreen extends StatelessWidget {
  const BrokerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(ConstantStrings.brokerDetailsTitle)),
      body: const Center(child: Text('Broker Details Screen - Placeholder')),
    );
  }
}
