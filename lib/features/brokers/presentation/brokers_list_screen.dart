import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_brokers/core/common/widgets/connectivity_wrapper.dart';
import 'package:top_brokers/core/constants/app_constants.dart';
import 'package:top_brokers/core/constants/app_dimensions.dart';
import 'package:top_brokers/core/constants/constant_strings.dart';
import 'package:top_brokers/core/services/connectivity_service.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/broker_list_item.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/empty_search_widget.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/empty_state_widget.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/error_display.dart';
import 'package:top_brokers/features/brokers/presentation/widgets/search_bar_widget.dart';
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
        title: const Text(AppStrings.brokersListTitle),
        centerTitle: true,
        actions: [
          if (!brokersState.isLoading &&
              !brokersState.hasError &&
              !brokersState.isEmptyWithoutSearch)
            IconButton(
              icon: Icon(
                brokersState.isSearchVisible ? Icons.close : Icons.search,
                color: AppConstants.textOnPrimaryColor,
              ),
              onPressed: () {
                ref
                    .read(brokersControllerProvider.notifier)
                    .toggleSearchVisibility();
              },
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: ConnectivityWrapper(
          child: Column(
            children: [
              if (brokersState.isSearchVisible)
                SearchBarWidget(
                  initialValue: brokersState.searchQuery,
                  onChanged: (query) {
                    ref.read(brokersControllerProvider.notifier).search(query);
                  },
                  onClear: () {
                    ref.read(brokersControllerProvider.notifier).clearSearch();
                  },
                ),
              Expanded(child: _buildBody(brokersState, isConnected)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BrokersState state, bool isConnected) {
    if (state.isLoading) {
      return const ShimmerLoading();
    }

    if (state.hasError) {
      return ErrorDisplay(
        message: state.isOfflineError
            ? AppStrings.noInternetConnectionAvailable
            : state.errorMessage,
        onRetry: () {
          ref.read(brokersControllerProvider.notifier).retry();
        },
        isOfflineError: state.isOfflineError,
      );
    }

    // Check for search results when searching
    if (state.isSearching && state.filteredBrokers.isEmpty) {
      return EmptySearchWidget(
        searchQuery: state.searchQuery,
        onClearSearch: () {
          ref.read(brokersControllerProvider.notifier).clearSearch();
        },
      );
    }

    // Check for empty state when no brokers available from API
    if (state.isEmptyWithoutSearch) {
      return EmptyStateWidget(
        onRetry: () {
          ref.read(brokersControllerProvider.notifier).retry();
        },
      );
    }

    // Show data if available
    if (state.hasData) {
      return RefreshIndicator(
        onRefresh: () async {
          await ref.read(brokersControllerProvider.notifier).loadBrokers();
        },
        child: ListView.builder(
          itemCount: state.displayBrokers.length,
          padding: EdgeInsets.only(
            top: AppDimensions.smallPadding,
            bottom: AppDimensions.defaultPadding,
          ),
          itemBuilder: (context, index) {
            return BrokerListItem(broker: state.displayBrokers[index]);
          },
        ),
      );
    }

    // Fallback loading state
    return const Center(child: CircularProgressIndicator());
  }
}
