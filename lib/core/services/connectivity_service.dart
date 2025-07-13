import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_service.g.dart';

@riverpod
class ConnectivityNotifier extends _$ConnectivityNotifier {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  bool build() {
    ref.onDispose(() {
      _subscription?.cancel();
    });
    _startListening();
    return true;
  }

  void _startListening() {
    _subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final isConnected = results.any(
        (result) =>
            result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi ||
            result == ConnectivityResult.ethernet,
      );
      state = isConnected;
    });
  }

  Future<bool> checkConnectivity() async {
    final results = await Connectivity().checkConnectivity();
    final isConnected = results.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet,
    );
    state = isConnected;
    return isConnected;
  }
}
