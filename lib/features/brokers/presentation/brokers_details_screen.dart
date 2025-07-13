import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/data/models/broker.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/broker_header_widget.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/broker_section_widget.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/visit_broker_button_widget.dart';

class BrokerDetailsScreen extends StatelessWidget {
  final Broker broker;

  const BrokerDetailsScreen({super.key, required this.broker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(broker.bn),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppConstants.textOnPrimaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrokerHeaderWidget(broker: broker),
                SizedBox(height: AppDimensions.largePadding),
                BrokerSectionWidget.generalInformation(broker: broker),
                SizedBox(height: AppDimensions.largePadding),
                BrokerSectionWidget.accountOptions(broker: broker),
                if (broker.gi.isNotEmpty) ...[
                  SizedBox(height: AppDimensions.largePadding),
                  BrokerSectionWidget.description(broker: broker),
                ],
                SizedBox(height: AppDimensions.largePadding),
                VisitBrokerButtonWidget(
                  broker: broker,
                  onUrlLaunchError: _showErrorSnackBar,
                ),
                SizedBox(height: AppDimensions.largePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppConstants.errorColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        ),
      ),
    );
  }
}
