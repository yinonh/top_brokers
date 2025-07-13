import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/data/models/broker.dart';

class VisitBrokerButtonWidget extends StatelessWidget {
  final Broker broker;
  final Function(BuildContext, String) onUrlLaunchError;

  const VisitBrokerButtonWidget({
    super.key,
    required this.broker,
    required this.onUrlLaunchError,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _launchBrokerUrl(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.secondaryColor,
          foregroundColor: AppConstants.textOnSecondaryColor,
          elevation: 4,
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.defaultPadding + 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.largeRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.open_in_new),
            SizedBox(width: AppDimensions.smallPadding),
            Text(
              AppStrings.visitBrokerWebsite,
              style: TextStyle(
                fontSize: AppDimensions.titleFontSize,
                fontWeight: AppConstants.fontWeightSemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchBrokerUrl(BuildContext context) async {
    final encodedUrl = broker.lu;
    if (encodedUrl.isNotEmpty) {
      try {
        final decodedUrl = Uri.decodeFull(encodedUrl);
        final uri = Uri.parse(decodedUrl);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $uri');
        }
      } catch (e) {
        onUrlLaunchError(context, '${AppStrings.invalidUrl}: $e');
      }
    } else {
      onUrlLaunchError(context, AppStrings.noUrlAvailable);
    }
  }
}
