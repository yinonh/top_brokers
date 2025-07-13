import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_brokers/core/common/widgets/connectivity_wrapper.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/core/services/connectivity_service.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/broker_list_item.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/error_display.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/shimmer_loading.dart';
import 'package:top_brokers/features/brokers/view_moudle/brokers_list_controller.dart';

class BrokersListScreen extends ConsumerStatefulWidget {
  const BrokersListScreen({super.key});

  @override
  ConsumerState<BrokersListScreen> createState() => _BrokersListScreenState();
}

class _BrokersListScreenState extends ConsumerState<BrokersListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(brokersControllerProvider.notifier).loadBrokers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final brokersState = ref.watch(brokersControllerProvider);
    final isConnected = ref.watch(connectivityNotifierProvider);

    ref.listen<bool>(connectivityNotifierProvider, (previous, next) {
      if (previous == false && next == true && brokersState.isOfflineError) {
        ref.read(brokersControllerProvider.notifier).loadBrokers();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantStrings.brokersListTitle),
        centerTitle: true,
      ),
      body: ConnectivityWrapper(child: _buildBody(brokersState, isConnected)),
    );
  }

  Widget _buildBody(BrokersState state, bool isConnected) {
    if (state.isLoading) {
      return const ShimmerLoading();
    }

    if (state.hasError) {
      return ErrorDisplay(
        message: state.isOfflineError
            ? 'No internet connection available'
            : state.errorMessage,
        onRetry: () {
          ref.read(brokersControllerProvider.notifier).retry();
        },
        isOfflineError: state.isOfflineError,
      );
    }

    if (state.isEmpty) {
      return const Center(child: Text(ConstantStrings.noDataAvailable));
    }

    if (state.hasData) {
      return RefreshIndicator(
        onRefresh: () async {
          await ref.read(brokersControllerProvider.notifier).loadBrokers();
        },
        child: ListView.builder(
          itemCount: state.brokers.length,
          padding: const EdgeInsets.only(top: 8),
          itemBuilder: (context, index) {
            return BrokerListItem(broker: state.brokers[index]);
          },
        ),
      );
    }

    return const Center(child: Text(ConstantStrings.loading));
  }
}
