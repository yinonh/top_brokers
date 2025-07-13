import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.only(top: AppDimensions.smallPadding),
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(
            horizontal: AppDimensions.listItemMarginHorizontal,
            vertical: AppDimensions.listItemMarginVertical,
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.defaultPadding),
              child: Row(
                children: [
                  Container(
                    width: AppDimensions.brokerImageWidth,
                    height: AppDimensions.brokerImageHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.smallRadius,
                      ),
                    ),
                  ),
                  SizedBox(width: AppDimensions.defaultPadding),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppDimensions.shimmerItemHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.smallRadius,
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimensions.smallPadding),
                        Container(
                          height: AppDimensions.shimmerSmallItemHeight,
                          width: AppDimensions.shimmerSmallItemWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.smallRadius,
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimensions.smallPadding / 2),
                        Container(
                          height: AppDimensions.shimmerSmallItemHeight,
                          width: AppDimensions.shimmerMediumItemWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.smallRadius,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppDimensions.shimmerButtonWidth,
                    height: AppDimensions.buttonHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.smallRadius,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
