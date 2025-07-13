import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_routes.dart';
import 'package:top_brokers/core/constants/api_endpoints.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/data/models/broker.dart';

class BrokerListItem extends StatelessWidget {
  final Broker broker;

  const BrokerListItem({super.key, required this.broker});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.listItemMarginHorizontal,
        vertical: AppDimensions.listItemMarginVertical,
      ),
      elevation: AppDimensions.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        onTap: () => context.push(AppRoutes.brokerDetails, extra: broker),
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.defaultPadding),
          child: Row(
            children: [
              Container(
                width: AppDimensions.brokerImageWidth,
                height: AppDimensions.brokerImageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.smallRadius,
                  ),
                  color: AppConstants.backgroundColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.smallRadius,
                  ),
                  child: Image.network(
                    '${ApiEndpoints.brokersImageBaseUrl}${broker.brokerImage}',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.business,
                        color: AppConstants.textSecondaryColor,
                        size: AppDimensions.defaultIconSize,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: AppDimensions.defaultPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      broker.bn,
                      style: TextStyle(
                        fontSize: AppDimensions.titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: AppConstants.textPrimaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppDimensions.smallPadding / 2),
                    Text(
                      broker.bt,
                      style: TextStyle(
                        fontSize: AppDimensions.bodyFontSize,
                        color: AppConstants.textSecondaryColor,
                      ),
                    ),
                    SizedBox(height: AppDimensions.smallPadding / 4),
                    Text(
                      '${AppStrings.regulationBy} ${broker.rt}',
                      style: TextStyle(
                        fontSize: AppDimensions.smallFontSize,
                        color: AppConstants.textSecondaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.smallPadding * 1.5,
                  vertical: AppDimensions.smallPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.smallRadius,
                  ),
                ),
                child: Text(
                  AppStrings.openButton,
                  style: TextStyle(
                    color: AppConstants.onPrimaryColor,
                    fontSize: AppDimensions.bodyFontSize,
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
