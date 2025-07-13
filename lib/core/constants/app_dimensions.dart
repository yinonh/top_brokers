import 'package:top_brokers/core/constants/size_config.dart';

class AppDimensions {
  // Padding values
  static double get defaultPadding => calcWidth(16.0);
  static double get smallPadding => calcWidth(8.0);
  static double get largePadding => calcWidth(24.0);
  static double get extraLargePadding => calcWidth(32.0);

  // Radius values
  static double get defaultRadius => calcWidth(8.0);
  static double get smallRadius => calcWidth(4.0);
  static double get largeRadius => calcWidth(16.0);

  // Icon sizes
  static double get defaultIconSize => calcWidth(24.0);
  static double get smallIconSize => calcWidth(16.0);
  static double get largeIconSize => calcWidth(32.0);
  static double get extraLargeIconSize => calcWidth(64.0);

  // Font sizes
  static double get captionFontSize => calcWidth(10.0);
  static double get smallFontSize => calcWidth(11.0);
  static double get bodyFontSize => calcWidth(12.0);
  static double get defaultFontSize => calcWidth(14.0);
  static double get titleFontSize => calcWidth(16.0);
  static double get headlineFontSize => calcWidth(18.0);

  // Component specific sizes
  static double get brokerImageWidth => calcWidth(60.0);
  static double get brokerImageHeight => calcHeight(40.0);
  static double get buttonHeight => calcHeight(28.0);
  static double get listItemMarginHorizontal => calcWidth(16.0);
  static double get listItemMarginVertical => calcWidth(8.0);
  static double get cardElevation => 2.0;
  static double get infoRowVerticalPadding => calcHeight(4.0);
  static double get infoLabelWidth => calcWidth(150.0);

  // Shimmer dimensions
  static double get shimmerItemHeight => calcHeight(16.0);
  static double get shimmerSmallItemHeight => calcHeight(12.0);
  static double get shimmerSmallItemWidth => calcWidth(120.0);
  static double get shimmerMediumItemWidth => calcWidth(180.0);
  static double get shimmerButtonWidth => calcWidth(50.0);

  // Error display
  static double get errorIconSize => calcWidth(64.0);
  static double get errorButtonPaddingHorizontal => calcWidth(24.0);
  static double get errorButtonPaddingVertical => calcWidth(16.0);
}
