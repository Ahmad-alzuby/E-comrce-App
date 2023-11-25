import 'checks.dart';
import 'networks.dart';
import 'three_d_secure_usage.dart';

class Card {
  String? brand;
  Checks? checks;
  String? country;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  dynamic generatedFrom;
  String? last4;
  Networks? networks;
  ThreeDSecureUsage? threeDSecureUsage;
  dynamic wallet;

  Card({
    this.brand,
    this.checks,
    this.country,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.generatedFrom,
    this.last4,
    this.networks,
    this.threeDSecureUsage,
    this.wallet,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        brand: json['brand'] as String?,
        checks: json['checks'] == null
            ? null
            : Checks.fromJson(json['checks'] as Map<String, dynamic>),
        country: json['country'] as String?,
        expMonth: json['exp_month'] as int?,
        expYear: json['exp_year'] as int?,
        fingerprint: json['fingerprint'] as String?,
        funding: json['funding'] as String?,
        generatedFrom: json['generated_from'] as dynamic,
        last4: json['last4'] as String?,
        networks: json['networks'] == null
            ? null
            : Networks.fromJson(json['networks'] as Map<String, dynamic>),
        threeDSecureUsage: json['three_d_secure_usage'] == null
            ? null
            : ThreeDSecureUsage.fromJson(
                json['three_d_secure_usage'] as Map<String, dynamic>),
        wallet: json['wallet'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'brand': brand,
        'checks': checks?.toJson(),
        'country': country,
        'exp_month': expMonth,
        'exp_year': expYear,
        'fingerprint': fingerprint,
        'funding': funding,
        'generated_from': generatedFrom,
        'last4': last4,
        'networks': networks?.toJson(),
        'three_d_secure_usage': threeDSecureUsage?.toJson(),
        'wallet': wallet,
      };
}
