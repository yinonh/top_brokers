import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/data/models/broker.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/info_row.dart';

class BrokerDetailsScreen extends StatelessWidget {
  final Broker broker;

  const BrokerDetailsScreen({super.key, required this.broker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(broker.bn)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.generalInformation,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: AppDimensions.headlineFontSize,
              ),
            ),
            SizedBox(height: AppDimensions.defaultPadding),
            InfoRow(label: AppStrings.brokerType, value: broker.bt),
            InfoRow(
              label: AppStrings.country,
              value: broker.c ?? AppStrings.na,
            ),
            InfoRow(label: AppStrings.operatingSinceYear, value: broker.os),
            InfoRow(
              label: AppStrings.numberOfEmployees,
              value: broker.noe.toString(),
            ),
            InfoRow(label: AppStrings.regulation, value: broker.rt),
            InfoRow(label: AppStrings.address, value: broker.ad),
            InfoRow(label: AppStrings.brokerStatus, value: broker.bs),
            SizedBox(height: AppDimensions.largePadding),
            Text(
              AppStrings.accountOptions,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: AppDimensions.headlineFontSize,
              ),
            ),
            SizedBox(height: AppDimensions.defaultPadding),
            InfoRow(label: AppStrings.accountCurrency, value: broker.ac),
            InfoRow(
              label: AppStrings.fundingWithdrawalMethods,
              value: broker.fwm,
            ),
            InfoRow(
              label: AppStrings.swapFreeAccounts,
              value: broker.sfa ? AppStrings.yes : AppStrings.no,
            ),
            InfoRow(
              label: AppStrings.segregatedAccounts,
              value: broker.sega ? AppStrings.yes : AppStrings.no,
            ),
            InfoRow(
              label: AppStrings.interestOnMargin,
              value: broker.iom ? AppStrings.yes : AppStrings.no,
            ),
            SizedBox(height: AppDimensions.largePadding),
            if (broker.gi.isNotEmpty) ...[
              Text(
                AppStrings.description,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: AppDimensions.headlineFontSize,
                ),
              ),
              SizedBox(height: AppDimensions.smallPadding),
              Text(
                broker.gi,
                style: TextStyle(fontSize: AppDimensions.defaultFontSize),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
