import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.only(top: AppDimensions.smallPadding),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppDimensions.listItemMarginHorizontal,
            vertical: AppDimensions.listItemMarginVertical,
          ),
          decoration: BoxDecoration(
            color: AppConstants.cardColor,
            borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
            border: Border.all(color: AppConstants.borderColor, width: 1),
          ),
          child: Shimmer.fromColors(
            baseColor: AppConstants.shimmerBaseColor,
            highlightColor: AppConstants.shimmerHighlightColor,
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.defaultPadding),
              child: Row(
                children: [
                  _buildShimmerImage(),
                  SizedBox(width: AppDimensions.defaultPadding),
                  Expanded(child: _buildShimmerContent()),
                  _buildShimmerButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShimmerImage() {
    return Container(
      width: AppDimensions.brokerImageWidth,
      height: AppDimensions.brokerImageHeight,
      decoration: BoxDecoration(
        color: AppConstants.gray200,
        borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
      ),
    );
  }

  Widget _buildShimmerContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppDimensions.shimmerItemHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppConstants.gray200,
            borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
          ),
        ),
        SizedBox(height: AppDimensions.smallPadding),
        Container(
          height: AppDimensions.shimmerSmallItemHeight,
          width: AppDimensions.shimmerSmallItemWidth,
          decoration: BoxDecoration(
            color: AppConstants.gray200,
            borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
          ),
        ),
        SizedBox(height: AppDimensions.smallPadding / 2),
        Container(
          height: AppDimensions.shimmerSmallItemHeight,
          width: AppDimensions.shimmerMediumItemWidth,
          decoration: BoxDecoration(
            color: AppConstants.gray200,
            borderRadius: BorderRadius.circular(AppDimensions.smallRadius),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerButton() {
    return Container(
      width: AppDimensions.shimmerButtonWidth,
      height: AppDimensions.buttonHeight,
      decoration: BoxDecoration(
        color: AppConstants.gray200,
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
      ),
    );
  }
}
