import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';

class ErrorDisplay extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final bool isOfflineError;

  const ErrorDisplay({
    super.key,
    required this.message,
    required this.onRetry,
    this.isOfflineError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.largePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isOfflineError ? Icons.wifi_off : Icons.error_outline,
              size: AppDimensions.errorIconSize,
              color: AppConstants.errorColor,
            ),
            SizedBox(height: AppDimensions.defaultPadding),
            Text(
              isOfflineError
                  ? AppStrings.connectionProblem
                  : AppStrings.errorLoadingBrokers,
              style: TextStyle(
                fontSize: AppDimensions.headlineFontSize,
                fontWeight: FontWeight.w600,
                color: AppConstants.textPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.smallPadding),
            Text(
              message,
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
                foregroundColor: AppConstants.onPrimaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.errorButtonPaddingHorizontal,
                  vertical: AppDimensions.errorButtonPaddingVertical,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.defaultRadius,
                  ),
                ),
              ),
              child: Text(
                isOfflineError
                    ? AppStrings.checkConnection
                    : AppStrings.tryAgain,
                style: TextStyle(
                  fontSize: AppDimensions.titleFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
