import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:top_brokers/core/network/dio_client.dart';
import 'package:top_brokers/core/constants/api_endpoints.dart';
import 'package:top_brokers/data/models/broker.dart';

part 'broker_repository.g.dart';

abstract class BrokerRepository {
  Future<List<Broker>> getBrokers();
}

class BrokerRepositoryImpl implements BrokerRepository {
  final Dio _dio;

  BrokerRepositoryImpl(this._dio);

  @override
  Future<List<Broker>> getBrokers() async {
    try {
      final response = await _dio.get(ApiEndpoints.promotedBrokers);
      final brokerResponse = BrokerResponse.fromJson(response.data);
      return brokerResponse.brokerManageArray;
    } catch (e) {
      throw Exception('Failed to fetch brokers: $e');
    }
  }
}

@riverpod
class BrokerRepositoryNotifier extends _$BrokerRepositoryNotifier {
  @override
  BrokerRepository build() {
    return BrokerRepositoryImpl(DioClient.instance);
  }

  Future<List<Broker>> getBrokers() async {
    return await state.getBrokers();
  }
}
