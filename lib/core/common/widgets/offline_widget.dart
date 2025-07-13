import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/services/connectivity_service.dart';

class OfflineWidget extends ConsumerWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppConstants.largePadding),
      decoration: const BoxDecoration(
        color: AppConstants.errorColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.defaultRadius),
          bottomRight: Radius.circular(AppConstants.defaultRadius),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.wifi_off,
                  color: AppConstants.onErrorColor,
                  size: 24,
                ),
                const SizedBox(width: AppConstants.smallPadding),
                const Expanded(
                  child: Text(
                    'No Internet Connection',
                    style: TextStyle(
                      color: AppConstants.onErrorColor,
                      fontSize: 16,
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
                  child: const Text(
                    'Retry',
                    style: TextStyle(
                      color: AppConstants.onErrorColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.smallPadding),
            const Text(
              'Please check your connection and try again',
              style: TextStyle(color: AppConstants.onErrorColor, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
