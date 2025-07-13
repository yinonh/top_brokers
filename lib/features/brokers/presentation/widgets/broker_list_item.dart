import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_routes.dart';
import 'package:top_brokers/core/constants/api_endpoints.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/data/models/broker.dart';

class BrokerListItem extends StatelessWidget {
  final Broker broker;

  const BrokerListItem({super.key, required this.broker});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.smallPadding,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        onTap: () => context.push(AppRoutes.brokerDetails, extra: broker),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                  color: AppConstants.backgroundColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                  child: Image.network(
                    '${ApiEndpoints.brokersImageBaseUrl}${broker.brokerImage}',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.business,
                        color: AppConstants.textSecondaryColor,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      broker.bn,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppConstants.textPrimaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      broker.bt,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppConstants.textSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Regulation by ${broker.rt}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppConstants.textSecondaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  ConstantStrings.openButton,
                  style: TextStyle(
                    color: AppConstants.onPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
