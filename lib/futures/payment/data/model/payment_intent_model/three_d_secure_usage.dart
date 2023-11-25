class ThreeDSecureUsage {
  bool? supported;

  ThreeDSecureUsage({this.supported});

  factory ThreeDSecureUsage.fromJson(Map<String, dynamic> json) {
    return ThreeDSecureUsage(
      supported: json['supported'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'supported': supported,
      };
}
