import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const EmptyStateWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.largePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.business_center_outlined,
              size: AppDimensions.errorIconSize,
              color: AppConstants.gray400,
            ),
            SizedBox(height: AppDimensions.defaultPadding),
            Text(
              AppStrings.noBrokersAvailable,
              style: TextStyle(
                fontSize: AppDimensions.headlineFontSize,
                fontWeight: AppConstants.fontWeightSemiBold,
                color: AppConstants.textPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.smallPadding),
            Text(
              AppStrings.noBrokersDescription,
              style: TextStyle(
                fontSize: AppDimensions.defaultFontSize,
                color: AppConstants.textSecondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.largePadding),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor,
                foregroundColor: AppConstants.textOnPrimaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.largePadding,
                  vertical: AppDimensions.defaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.defaultRadius,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh, size: AppDimensions.defaultIconSize),
                  SizedBox(width: AppDimensions.smallPadding),
                  Text(
                    AppStrings.refresh,
                    style: TextStyle(
                      fontSize: AppDimensions.titleFontSize,
                      fontWeight: AppConstants.fontWeightSemiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
