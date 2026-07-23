class ConditionModel {
  final String text;
  final String icon;
  final int code;

  const ConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon,
      'code': code,
    };
  }
}
