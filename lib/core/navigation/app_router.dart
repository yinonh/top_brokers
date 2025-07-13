import 'package:go_router/go_router.dart';
import 'package:top_brokers/core/constants/app_routes.dart';
import 'package:top_brokers/data/models/broker.dart';
import 'package:top_brokers/features/brokers/presentation/brokers_details_screen.dart';
import 'package:top_brokers/features/brokers/presentation/brokers_list_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.brokersList,
  routes: [
    GoRoute(
      path: AppRoutes.brokersList,
      builder: (context, state) => const BrokersListScreen(),
    ),
    GoRoute(
      path: AppRoutes.brokerDetails,
      builder: (context, state) {
        final broker = state.extra as Broker;
        return BrokerDetailsScreen(broker: broker);
      },
    ),
  ],
);
