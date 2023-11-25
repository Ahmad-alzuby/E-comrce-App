class Networks {
  List<String>? available;
  dynamic preferred;

  Networks({this.available, this.preferred});

  factory Networks.fromJson(Map<String, dynamic> json) => Networks(
        available: json['available'] as List<String>?,
        preferred: json['preferred'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'preferred': preferred,
      };
}
