import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/core/constants/api_endpoints.dart';
import 'package:top_brokers/data/models/broker.dart';

class BrokerHeaderWidget extends StatelessWidget {
  final Broker broker;

  const BrokerHeaderWidget({super.key, required this.broker});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.defaultPadding),
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppDimensions.largeRadius),
        boxShadow: [
          BoxShadow(
            color: AppConstants.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppConstants.borderColor, width: 1),
      ),
      child: Row(
        children: [
          _BrokerImage(brokerImage: broker.brokerImage),
          SizedBox(width: AppDimensions.defaultPadding),
          Expanded(child: _BrokerHeaderInfo(brokerName: broker.bn)),
        ],
      ),
    );
  }
}

class _BrokerImage extends StatelessWidget {
  final String brokerImage;

  const _BrokerImage({required this.brokerImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        color: AppConstants.gray50,
        border: Border.all(color: AppConstants.borderColor, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        child: Image.network(
          '${ApiEndpoints.brokersImageBaseUrl}$brokerImage',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: const BoxDecoration(color: AppConstants.gray100),
              child: const Icon(
                Icons.business,
                color: AppConstants.gray500,
                size: 32,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BrokerHeaderInfo extends StatelessWidget {
  final String brokerName;

  const _BrokerHeaderInfo({required this.brokerName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          brokerName,
          style: TextStyle(
            fontSize: AppDimensions.headlineFontSize,
            fontWeight: AppConstants.fontWeightBold,
            color: AppConstants.textPrimaryColor,
          ),
        ),
        SizedBox(height: AppDimensions.smallPadding / 2),
        _VerifiedBadge(),
      ],
    );
  }
}

class _VerifiedBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.smallPadding,
        vertical: AppDimensions.smallPadding / 2,
      ),
      decoration: BoxDecoration(
        color: AppConstants.successColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
        border: Border.all(
          color: AppConstants.successColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified,
            size: AppDimensions.smallIconSize,
            color: AppConstants.successColor,
          ),
          SizedBox(width: AppDimensions.smallPadding / 2),
          Text(
            AppStrings.verified,
            style: TextStyle(
              fontSize: AppDimensions.smallFontSize,
              fontWeight: AppConstants.fontWeightMedium,
              color: AppConstants.successColor,
            ),
          ),
        ],
      ),
    );
  }
}
