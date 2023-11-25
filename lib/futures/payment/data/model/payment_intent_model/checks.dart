class Checks {
  dynamic addressLine1Check;
  dynamic addressPostalCodeCheck;
  String? cvcCheck;

  Checks({
    this.addressLine1Check,
    this.addressPostalCodeCheck,
    this.cvcCheck,
  });

  factory Checks.fromJson(Map<String, dynamic> json) => Checks(
        addressLine1Check: json['address_line1_check'] as dynamic,
        addressPostalCodeCheck: json['address_postal_code_check'] as dynamic,
        cvcCheck: json['cvc_check'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'address_line1_check': addressLine1Check,
        'address_postal_code_check': addressPostalCodeCheck,
        'cvc_check': cvcCheck,
      };
}
