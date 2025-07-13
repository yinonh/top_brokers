import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:top_brokers/data/models/broker.dart';
import 'package:top_brokers/data/repositories/broker_repository.dart';

part 'brokers_list_controller.freezed.dart';
part 'brokers_list_controller.g.dart';

@freezed
abstract class BrokersState with _$BrokersState {
  const factory BrokersState({
    @Default(false) bool isLoading,
    @Default([]) List<Broker> brokers,
    @Default('') String errorMessage,
    @Default(false) bool hasError,
    @Default(false) bool isInitialized,
  }) = _BrokersState;
}

extension BrokersStateX on BrokersState {
  bool get hasData => brokers.isNotEmpty;
  bool get isEmpty => brokers.isEmpty && isInitialized && !hasError;
}

@riverpod
class BrokersController extends _$BrokersController {
  @override
  BrokersState build() {
    return const BrokersState();
  }

  Future<void> loadBrokers() async {
    state = state.copyWith(isLoading: true, hasError: false, errorMessage: '');

    try {
      final repository = ref.read(brokerRepositoryNotifierProvider);
      final brokers = await repository.getBrokers();

      state = state.copyWith(
        isLoading: false,
        brokers: brokers,
        isInitialized: true,
        hasError: false,
        errorMessage: '',
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
        isInitialized: true,
      );
    }
  }

  void retry() {
    loadBrokers();
  }

  void clearError() {
    state = state.copyWith(hasError: false, errorMessage: '');
  }
}
