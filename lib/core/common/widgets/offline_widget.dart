import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/core/services/connectivity_service.dart';

class OfflineWidget extends ConsumerWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppDimensions.largePadding),
      decoration: BoxDecoration(
        color: AppConstants.errorColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimensions.defaultRadius),
          bottomRight: Radius.circular(AppDimensions.defaultRadius),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.wifi_off,
                  color: AppConstants.onErrorColor,
                  size: AppDimensions.defaultIconSize,
                ),
                SizedBox(width: AppDimensions.smallPadding),
                Expanded(
                  child: Text(
                    AppStrings.noInternetConnection,
                    style: TextStyle(
                      color: AppConstants.onErrorColor,
                      fontSize: AppDimensions.titleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ref
                        .read(connectivityNotifierProvider.notifier)
                        .checkConnectivity();
                  },
                  child: Text(
                    AppStrings.retry,
                    style: TextStyle(
                      color: AppConstants.onErrorColor,
                      fontSize: AppDimensions.defaultFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimensions.smallPadding),
            Text(
              AppStrings.pleaseCheckConnectionAndTryAgain,
              style: TextStyle(
                color: AppConstants.onErrorColor,
                fontSize: AppDimensions.defaultFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
