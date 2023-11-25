// ignore_for_file: file_names

class CategrayModel {
  String categrayName;
  CategrayModel({required this.categrayName});

  factory CategrayModel.fromJson(List<CategrayModel> json, int index) {
    return CategrayModel(categrayName: json[index].categrayName);
  }
}
