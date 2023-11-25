// ignore_for_file: public_member_api_docs, sort_ ructors_first
class PaymentIntentInputModel {
  String amount;
  String currency;
  PaymentIntentInputModel({required this.amount, required this.currency});

  toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
