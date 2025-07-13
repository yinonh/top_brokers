import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:top_brokers/core/services/connectivity_service.dart';
import 'package:top_brokers/data/models/broker.dart';
import 'package:top_brokers/data/repositories/broker_repository.dart';

part 'brokers_list_controller.freezed.dart';
part 'brokers_list_controller.g.dart';

@freezed
abstract class BrokersState with _$BrokersState {
  const factory BrokersState({
    @Default(false) bool isLoading,
    @Default([]) List<Broker> brokers,
    @Default([]) List<Broker> filteredBrokers,
    @Default('') String errorMessage,
    @Default(false) bool hasError,
    @Default(false) bool isInitialized,
    @Default(false) bool isOfflineError,
    @Default('') String searchQuery,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchVisible,
  }) = _BrokersState;
}

extension BrokersStateX on BrokersState {
  bool get hasData => filteredBrokers.isNotEmpty;
  bool get isEmpty =>
      filteredBrokers.isEmpty && isInitialized && !hasError && !isSearching;
  bool get isEmptyWithoutSearch =>
      brokers.isEmpty && isInitialized && !hasError;
  List<Broker> get displayBrokers => filteredBrokers;
}

@riverpod
class BrokersController extends _$BrokersController {
  @override
  BrokersState build() {
    return const BrokersState();
  }

  Future<void> loadBrokers() async {
    final isConnected = await ref
        .read(connectivityNotifierProvider.notifier)
        .checkConnectivity();

    if (!isConnected) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        isOfflineError: true,
        errorMessage:
            'No internet connection. Please check your connection and try again.',
        isInitialized: true,
      );
      return;
    }

    state = state.copyWith(
      isLoading: true,
      hasError: false,
      errorMessage: '',
      isOfflineError: false,
    );

    try {
      final repository = ref.read(brokerRepositoryNotifierProvider);
      final brokers = await repository.getBrokers();

      state = state.copyWith(
        isLoading: false,
        brokers: brokers,
        filteredBrokers: brokers,
        isInitialized: true,
        hasError: false,
        errorMessage: '',
        isOfflineError: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        isOfflineError: false,
        errorMessage: e.toString(),
        isInitialized: true,
      );
    }
  }

  void toggleSearchVisibility() {
    if (state.isSearchVisible) {
      hideSearch();
    } else {
      showSearch();
    }
  }

  void showSearch() {
    state = state.copyWith(isSearchVisible: true);
  }

  void hideSearch() {
    state = state.copyWith(
      isSearchVisible: false,
      searchQuery: '',
      filteredBrokers: state.brokers,
      isSearching: false,
    );
  }

  void search(String query) {
    state = state.copyWith(searchQuery: query, isSearching: query.isNotEmpty);

    if (query.isEmpty) {
      state = state.copyWith(
        filteredBrokers: state.brokers,
        isSearching: false,
      );
      return;
    }

    final filteredBrokers = state.brokers.where((broker) {
      return _matchesSearchQuery(broker, query.toLowerCase());
    }).toList();

    state = state.copyWith(filteredBrokers: filteredBrokers);
  }

  bool _matchesSearchQuery(Broker broker, String query) {
    return broker.bn.toLowerCase().contains(query) ||
        (broker.c?.toLowerCase().contains(query) ?? false) ||
        broker.rt.toLowerCase().contains(query) ||
        broker.bt.toLowerCase().contains(query) ||
        broker.gi.toLowerCase().contains(query) ||
        broker.ad.toLowerCase().contains(query);
  }

  void clearSearch() {
    state = state.copyWith(
      searchQuery: '',
      filteredBrokers: state.brokers,
      isSearching: false,
    );
  }

  void retry() {
    loadBrokers();
  }

  void clearError() {
    state = state.copyWith(
      hasError: false,
      errorMessage: '',
      isOfflineError: false,
    );
  }
}
