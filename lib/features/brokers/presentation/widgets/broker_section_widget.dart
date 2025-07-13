import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/data/models/broker.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/info_row.dart';

class BrokerSectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const BrokerSectionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  factory BrokerSectionWidget.generalInformation({required Broker broker}) {
    return BrokerSectionWidget(
      title: AppStrings.generalInformation,
      icon: Icons.info_outline,
      children: [
        InfoRow(label: AppStrings.brokerType, value: broker.bt),
        InfoRow(label: AppStrings.country, value: broker.c ?? AppStrings.na),
        InfoRow(label: AppStrings.operatingSinceYear, value: broker.os),
        InfoRow(
          label: AppStrings.numberOfEmployees,
          value: broker.noe.toString(),
        ),
        InfoRow(label: AppStrings.regulation, value: broker.rt),
        InfoRow(label: AppStrings.address, value: broker.ad),
        InfoRow(label: AppStrings.brokerStatus, value: broker.bs),
        InfoRow(
          label: AppStrings.acceptingUsClients,
          value: broker.auc ? AppStrings.yes : AppStrings.no,
        ),
      ],
    );
  }

  factory BrokerSectionWidget.accountOptions({required Broker broker}) {
    return BrokerSectionWidget(
      title: AppStrings.accountOptions,
      icon: Icons.account_balance,
      children: [
        InfoRow(label: AppStrings.accountCurrency, value: broker.ac),
        InfoRow(label: AppStrings.fundingWithdrawalMethods, value: broker.fwm),
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
        InfoRow(label: AppStrings.maxLeverage, value: '1:${broker.maxl}'),
        if (broker.mlot != null)
          InfoRow(label: AppStrings.minLotSize, value: broker.mlot.toString()),
        if (broker.maxlot != null)
          InfoRow(
            label: AppStrings.maxLotSize,
            value: broker.maxlot.toString(),
          ),
      ],
    );
  }

  factory BrokerSectionWidget.description({required Broker broker}) {
    return BrokerSectionWidget(
      title: AppStrings.description,
      icon: Icons.description,
      children: [_DescriptionContainer(description: broker.gi)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppDimensions.largeRadius),
        boxShadow: [
          BoxShadow(
            color: AppConstants.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: AppConstants.borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: title, icon: icon),
          Padding(
            padding: EdgeInsets.all(AppDimensions.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.defaultPadding),
      decoration: BoxDecoration(
        color: AppConstants.primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.largeRadius),
          topRight: Radius.circular(AppDimensions.largeRadius),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppConstants.primaryColor,
            size: AppDimensions.defaultIconSize,
          ),
          SizedBox(width: AppDimensions.smallPadding),
          Text(
            title,
            style: TextStyle(
              fontSize: AppDimensions.headlineFontSize,
              fontWeight: AppConstants.fontWeightSemiBold,
              color: AppConstants.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _DescriptionContainer extends StatelessWidget {
  final String description;

  const _DescriptionContainer({required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppDimensions.defaultPadding),
      decoration: BoxDecoration(
        color: AppConstants.gray50,
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        border: Border.all(color: AppConstants.borderColor, width: 1),
      ),
      child: Text(
        description,
        style: TextStyle(
          fontSize: AppDimensions.defaultFontSize,
          color: AppConstants.textPrimaryColor,
          height: 1.5,
        ),
      ),
    );
  }
}
