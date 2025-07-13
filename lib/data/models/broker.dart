import 'package:freezed_annotation/freezed_annotation.dart';

part 'broker.freezed.dart';
part 'broker.g.dart';

@freezed
abstract class Broker with _$Broker {
  const factory Broker({
    required int o,
    required String bn,
    String? c,
    required int md,
    required String mdcmnt,
    required bool da,
    @JsonKey(name: 'in') required String brokerImage,
    required int bo,
    required String os,
    required int noe,
    required String ad,
    required String bs,
    required bool auc,
    required String ph,
    required String fa,
    required String em,
    required bool mt,
    required String mtcmnt,
    required bool wbt,
    required String wbtcmnt,
    required bool api,
    required String apicmnt,
    required bool oco,
    required String ococmnt,
    required bool tof,
    required String tofcmnt,
    required bool hedg,
    required String hedgcmnt,
    required bool tlst,
    required String tlstcmnt,
    required bool oct,
    required String octcmnt,
    required bool bon,
    required String boncmnt,
    required bool cont,
    required String contcmnt,
    required int maxl,
    required String maxlcmnt,
    double? mlot,
    required String mlotcmnt,
    int? maxlot,
    required String maxlotcmnt,
    int? comi,
    required String comicmnt,
    required bool sfa,
    required String sfacmnt,
    required bool sega,
    required String segacmnt,
    required bool iom,
    required String iomcmnt,
    required bool mnga,
    required String mngacmnt,
    required String gi,
    required String tpt,
    required String mau,
    required String afmm,
    required String afmmcmnt,
    required String deci,
    required String scalA,
    required String scalAcmnt,
    required String lu,
    required String sl,
    required String tp,
    required String pct,
    required String rt,
    required String bt,
    required String ac,
    required String at,
    required String ecnS,
    required String it,
    required String fwm,
  }) = _Broker;

  factory Broker.fromJson(Map<String, dynamic> json) => _$BrokerFromJson(json);
}

@freezed
abstract class BrokerResponse with _$BrokerResponse {
  const factory BrokerResponse({
    required int sponsorBrokerManageOid,
    required List<Broker> brokerManageArray,
  }) = _BrokerResponse;

  factory BrokerResponse.fromJson(Map<String, dynamic> json) =>
      _$BrokerResponseFromJson(json);
}
