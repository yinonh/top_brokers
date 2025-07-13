import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/size_config.dart';
import 'package:top_brokers/core/navigation/app_router.dart';

import 'core/constants/constant_strings.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp.router(
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppConstants.primaryColor,
          secondary: AppConstants.secondaryColor,
          error: AppConstants.errorColor,
          surface: AppConstants.surfaceColor,
        ),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
