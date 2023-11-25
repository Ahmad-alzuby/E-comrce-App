import 'billing_details.dart';
import 'card.dart';
import 'metadata.dart';

class PaymentIntentModel {
  String? id;
  String? object;
  BillingDetails? billingDetails;
  Card? card;
  int? created;
  dynamic customer;
  bool? livemode;
  Metadata? metadata;
  String? type;

  PaymentIntentModel({
    this.id,
    this.object,
    this.billingDetails,
    this.card,
    this.created,
    this.customer,
    this.livemode,
    this.metadata,
    this.type,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      billingDetails: json['billing_details'] == null
          ? null
          : BillingDetails.fromJson(
              json['billing_details'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
      created: json['created'] as int?,
      customer: json['customer'] as dynamic,
      livemode: json['livemode'] as bool?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'billing_details': billingDetails?.toJson(),
        'card': card?.toJson(),
        'created': created,
        'customer': customer,
        'livemode': livemode,
        'metadata': metadata?.toJson(),
        'type': type,
      };
}
