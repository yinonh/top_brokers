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
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.listItemMarginHorizontal,
        vertical: AppDimensions.listItemMarginVertical,
      ),
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: AppConstants.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: AppConstants.borderColor, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
          onTap: () => context.push(AppRoutes.brokerDetails, extra: broker),
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.defaultPadding),
            child: Row(
              children: [
                _buildBrokerImage(),
                SizedBox(width: AppDimensions.defaultPadding),
                Expanded(child: _buildBrokerInfo()),
                _buildActionButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrokerImage() {
    return Container(
      width: AppDimensions.brokerImageWidth,
      height: AppDimensions.brokerImageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
        color: AppConstants.gray50,
        border: Border.all(color: AppConstants.borderColor, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
        child: Image.network(
          '${ApiEndpoints.brokersImageBaseUrl}${broker.brokerImage}',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: const BoxDecoration(color: AppConstants.gray100),
              child: Icon(
                Icons.business,
                color: AppConstants.gray500,
                size: AppDimensions.defaultIconSize,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBrokerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          broker.bn,
          style: TextStyle(
            fontSize: AppDimensions.titleFontSize,
            fontWeight: AppConstants.fontWeightSemiBold,
            color: AppConstants.textPrimaryColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppDimensions.smallPadding / 2),
        if (broker.c != null && broker.c!.isNotEmpty) ...[
          Text(
            broker.c!,
            style: TextStyle(
              fontSize: AppDimensions.bodyFontSize,
              fontWeight: AppConstants.fontWeightMedium,
              color: AppConstants.textSecondaryColor,
            ),
          ),
          SizedBox(height: AppDimensions.smallPadding / 2),
        ],
        Row(
          children: [
            Icon(
              Icons.verified_user,
              size: AppDimensions.smallIconSize,
              color: AppConstants.successColor,
            ),
            SizedBox(width: AppDimensions.smallPadding / 2),
            Expanded(
              child: Text(
                '${AppStrings.regulationBy} ${broker.rt}',
                style: TextStyle(
                  fontSize: AppDimensions.smallFontSize,
                  color: AppConstants.textSecondaryColor,
                  fontWeight: AppConstants.fontWeightRegular,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultPadding,
        vertical: AppDimensions.smallPadding,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppConstants.secondaryColor,
            AppConstants.secondaryDarkColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: AppConstants.secondaryColor.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        AppStrings.openButton,
        style: TextStyle(
          color: AppConstants.textOnSecondaryColor,
          fontSize: AppDimensions.bodyFontSize,
          fontWeight: AppConstants.fontWeightSemiBold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
