import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
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
        padding: const EdgeInsets.all(AppConstants.largePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isOfflineError ? Icons.wifi_off : Icons.error_outline,
              size: 64,
              color: AppConstants.errorColor,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              isOfflineError
                  ? 'Connection Problem'
                  : ConstantStrings.errorLoadingBrokers,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppConstants.textPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: AppConstants.textSecondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.largePadding),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor,
                foregroundColor: AppConstants.onPrimaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.largePadding,
                  vertical: AppConstants.defaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.defaultRadius,
                  ),
                ),
              ),
              child: Text(
                isOfflineError ? 'Check Connection' : ConstantStrings.tryAgain,
                style: const TextStyle(
                  fontSize: 16,
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
