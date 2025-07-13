import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/size_config.dart';
import 'package:top_brokers/core/navigation/app_router.dart';
import 'core/constants/constant_strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppConstants.backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      routerConfig: appRouter,
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppConstants.primaryColor,
        primaryContainer: AppConstants.primaryLightColor,
        secondary: AppConstants.secondaryColor,
        secondaryContainer: AppConstants.secondaryLightColor,
        surface: AppConstants.surfaceColor,
        background: AppConstants.backgroundColor,
        error: AppConstants.errorColor,
        onPrimary: AppConstants.textOnPrimaryColor,
        onSecondary: AppConstants.textOnSecondaryColor,
        onSurface: AppConstants.textPrimaryColor,
        onBackground: AppConstants.textPrimaryColor,
        onError: AppConstants.onErrorColor,
        outline: AppConstants.borderColor,
        surfaceVariant: AppConstants.gray50,
      ),

      scaffoldBackgroundColor: AppConstants.backgroundColor,

      appBarTheme: const AppBarTheme(
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: AppConstants.textOnPrimaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppConstants.textOnPrimaryColor,
          fontSize: AppConstants.fontSizeHeadline,
          fontWeight: AppConstants.fontWeightSemiBold,
        ),
        iconTheme: IconThemeData(color: AppConstants.textOnPrimaryColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),

      cardTheme: CardThemeData(
        color: AppConstants.cardColor,
        elevation: AppConstants.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        ),
        shadowColor: AppConstants.shadowColor,
        margin: EdgeInsets.zero,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.secondaryColor,
          foregroundColor: AppConstants.textOnSecondaryColor,
          elevation: 2,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.largePadding,
            vertical: AppConstants.defaultPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          ),
          textStyle: const TextStyle(
            fontSize: AppConstants.fontSizeTitle,
            fontWeight: AppConstants.fontWeightSemiBold,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppConstants.primaryColor,
          textStyle: const TextStyle(
            fontSize: AppConstants.fontSizeBody,
            fontWeight: AppConstants.fontWeightMedium,
          ),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: AppConstants.dividerColor,
        thickness: 1,
        space: 1,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: AppConstants.fontSizeDisplay,
          fontWeight: AppConstants.fontWeightBold,
          color: AppConstants.textPrimaryColor,
        ),
        headlineLarge: TextStyle(
          fontSize: AppConstants.fontSizeHeadline,
          fontWeight: AppConstants.fontWeightSemiBold,
          color: AppConstants.textPrimaryColor,
        ),
        titleLarge: TextStyle(
          fontSize: AppConstants.fontSizeTitle,
          fontWeight: AppConstants.fontWeightSemiBold,
          color: AppConstants.textPrimaryColor,
        ),
        bodyLarge: TextStyle(
          fontSize: AppConstants.fontSizeBody,
          fontWeight: AppConstants.fontWeightRegular,
          color: AppConstants.textPrimaryColor,
        ),
        bodyMedium: TextStyle(
          fontSize: AppConstants.fontSizeBody,
          fontWeight: AppConstants.fontWeightRegular,
          color: AppConstants.textSecondaryColor,
        ),
        bodySmall: TextStyle(
          fontSize: AppConstants.fontSizeSmall,
          fontWeight: AppConstants.fontWeightRegular,
          color: AppConstants.textSecondaryColor,
        ),
        labelLarge: TextStyle(
          fontSize: AppConstants.fontSizeBody,
          fontWeight: AppConstants.fontWeightMedium,
          color: AppConstants.textPrimaryColor,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          borderSide: const BorderSide(color: AppConstants.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          borderSide: const BorderSide(color: AppConstants.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          borderSide: const BorderSide(
            color: AppConstants.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          borderSide: const BorderSide(color: AppConstants.errorColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: AppConstants.defaultPadding,
        ),
      ),
    );
  }
}
