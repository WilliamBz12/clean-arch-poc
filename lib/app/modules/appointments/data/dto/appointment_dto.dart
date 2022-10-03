import 'dart:convert';

class AppointmentDTO {
  final String title;
  final int? id;

  AppointmentDTO({
    required this.title,
    this.id,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'id': id});

    return result;
  }

  factory AppointmentDTO.fromMap(Map<String, dynamic> map) {
    return AppointmentDTO(
      title: map['title'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentDTO.fromJson(String source) =>
      AppointmentDTO.fromMap(json.decode(source));

  static List<AppointmentDTO> parseToList(List data) =>
      data.map((e) => AppointmentDTO.fromJson(e)).toList();
}
