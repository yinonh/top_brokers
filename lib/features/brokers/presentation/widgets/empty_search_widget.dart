import 'package:flutter/material.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';

class EmptySearchWidget extends StatelessWidget {
  final String searchQuery;
  final VoidCallback onClearSearch;

  const EmptySearchWidget({
    super.key,
    required this.searchQuery,
    required this.onClearSearch,
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
              Icons.search_off,
              size: AppDimensions.errorIconSize,
              color: AppConstants.gray400,
            ),
            SizedBox(height: AppDimensions.defaultPadding),
            Text(
              AppStrings.noResultsFound,
              style: TextStyle(
                fontSize: AppDimensions.headlineFontSize,
                fontWeight: AppConstants.fontWeightSemiBold,
                color: AppConstants.textPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.smallPadding),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: AppDimensions.defaultFontSize,
                  color: AppConstants.textSecondaryColor,
                ),
                children: [
                  const TextSpan(text: AppStrings.noResultsFor),
                  TextSpan(
                    text: '"$searchQuery"',
                    style: TextStyle(
                      fontWeight: AppConstants.fontWeightSemiBold,
                      color: AppConstants.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.smallPadding),
            Text(
              AppStrings.tryDifferentKeywords,
              style: TextStyle(
                fontSize: AppDimensions.defaultFontSize,
                color: AppConstants.textSecondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.largePadding),
            ElevatedButton(
              onPressed: onClearSearch,
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
              child: Text(
                AppStrings.clearSearch,
                style: TextStyle(
                  fontSize: AppDimensions.titleFontSize,
                  fontWeight: AppConstants.fontWeightSemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
