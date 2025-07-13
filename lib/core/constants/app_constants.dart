import 'package:flutter/material.dart';

class AppConstants {
  // Primary Colors - Professional Blue-Gray Palette
  static const Color primaryColor = Color(0xFF2C3E50); // Dark Blue-Gray
  static const Color primaryLightColor = Color(0xFF34495E); // Medium Blue-Gray
  static const Color primaryDarkColor = Color(0xFF1A252F); // Darker Blue-Gray

  // Secondary Colors - Warm Orange Accents
  static const Color secondaryColor = Color(0xFFE67E22); // Professional Orange
  static const Color secondaryLightColor = Color(0xFFF39C12); // Light Orange
  static const Color secondaryDarkColor = Color(0xFFD35400); // Dark Orange

  // Surface and Background Colors
  static const Color backgroundColor = Color(
    0xFFF8F9FA,
  ); // Light Gray Background
  static const Color surfaceColor = Color(0xFFFFFFFF); // Pure White
  static const Color cardColor = Color(0xFFFFFFFF); // Card Background
  static const Color dividerColor = Color(0xFFE9ECEF); // Light Gray Divider

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF2C3E50); // Dark Blue-Gray
  static const Color textSecondaryColor = Color(0xFF6C757D); // Medium Gray
  static const Color textLightColor = Color(0xFF868E96); // Light Gray
  static const Color textOnPrimaryColor = Color(0xFFFFFFFF); // White on primary
  static const Color textOnSecondaryColor = Color(
    0xFFFFFFFF,
  ); // White on secondary

  // Status Colors
  static const Color successColor = Color(0xFF27AE60); // Green
  static const Color errorColor = Color(0xFFE74C3C); // Red
  static const Color warningColor = Color(0xFFF39C12); // Orange
  static const Color infoColor = Color(0xFF3498DB); // Blue

  // Neutral Grays
  static const Color gray50 = Color(0xFFF8F9FA);
  static const Color gray100 = Color(0xFFE9ECEF);
  static const Color gray200 = Color(0xFFDEE2E6);
  static const Color gray300 = Color(0xFFCED4DA);
  static const Color gray400 = Color(0xFFADB5BD);
  static const Color gray500 = Color(0xFF6C757D);
  static const Color gray600 = Color(0xFF495057);
  static const Color gray700 = Color(0xFF343A40);
  static const Color gray800 = Color(0xFF212529);
  static const Color gray900 = Color(0xFF1A1D20);

  // Legacy compatibility colors
  static const Color onPrimaryColor = textOnPrimaryColor;
  static const Color onSecondaryColor = textOnSecondaryColor;
  static const Color onErrorColor = Color(0xFFFFFFFF);
  static const Color onBackgroundColor = textPrimaryColor;
  static const Color onSurfaceColor = textPrimaryColor;

  // Component Colors
  static const Color shimmerBaseColor = gray300;
  static const Color shimmerHighlightColor = gray100;
  static const Color borderColor = gray200;
  static const Color shadowColor = Color(0x1A000000);

  // Sizing and Spacing
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  static const double defaultRadius = 8.0;
  static const double smallRadius = 4.0;
  static const double largeRadius = 16.0;
  static const double extraLargeRadius = 24.0;

  // Elevations
  static const double cardElevation = 2.0;
  static const double modalElevation = 8.0;
  static const double drawerElevation = 16.0;

  // Animation
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);
  static const Duration slowAnimationDuration = Duration(milliseconds: 500);

  // Typography Scale
  static const double fontSizeCaption = 10.0;
  static const double fontSizeSmall = 12.0;
  static const double fontSizeBody = 14.0;
  static const double fontSizeTitle = 16.0;
  static const double fontSizeHeadline = 18.0;
  static const double fontSizeDisplay = 24.0;

  // Font Weights
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
}
