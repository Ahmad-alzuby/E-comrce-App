import 'address.dart';

class BillingDetails {
  Address? address;
  dynamic email;
  dynamic name;
  dynamic phone;

  BillingDetails({this.address, this.email, this.name, this.phone});

  factory BillingDetails.fromJson(Map<String, dynamic> json) {
    return BillingDetails(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      email: json['email'] as dynamic,
      name: json['name'] as dynamic,
      phone: json['phone'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'address': address?.toJson(),
        'email': email,
        'name': name,
        'phone': phone,
      };
}
