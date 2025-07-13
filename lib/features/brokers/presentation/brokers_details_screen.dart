import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/data/models/broker.dart';

class BrokerDetailsScreen extends StatelessWidget {
  final Broker broker;

  const BrokerDetailsScreen({super.key, required this.broker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(broker.bn)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ConstantStrings.generalInformation,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Broker Type', broker.bt),
            _buildInfoRow('Country', broker.c ?? 'N/A'),
            _buildInfoRow('Operating since year', broker.os),
            _buildInfoRow('Number of employees', broker.noe.toString()),
            _buildInfoRow('Regulation', broker.rt),
            _buildInfoRow('Address', broker.ad),
            _buildInfoRow('Broker Status', broker.bs),
            const SizedBox(height: 24),
            Text(
              ConstantStrings.accountOptions,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Account currency', broker.ac),
            _buildInfoRow('Funding/Withdrawal methods', broker.fwm),
            _buildInfoRow('Swap free accounts', broker.sfa ? 'Yes' : 'No'),
            _buildInfoRow('Segregated accounts', broker.sega ? 'Yes' : 'No'),
            _buildInfoRow('Interest on margin', broker.iom ? 'Yes' : 'No'),
            const SizedBox(height: 24),
            if (broker.gi.isNotEmpty) ...[
              Text(
                'Description',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(broker.gi),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
