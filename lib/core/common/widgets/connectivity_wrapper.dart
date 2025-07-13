import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_brokers/core/common/widgets/offline_widget.dart';
import 'package:top_brokers/core/services/connectivity_service.dart';

class ConnectivityWrapper extends ConsumerWidget {
  final Widget child;
  final bool showOfflineWidget;

  const ConnectivityWrapper({
    super.key,
    required this.child,
    this.showOfflineWidget = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(connectivityNotifierProvider);

    return Column(
      children: [
        if (!isConnected && showOfflineWidget) const OfflineWidget(),
        Expanded(child: child),
      ],
    );
  }
}
