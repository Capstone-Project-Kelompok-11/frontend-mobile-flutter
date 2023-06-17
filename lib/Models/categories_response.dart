import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) =>
    CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) =>
    json.encode(data.toJson());

class CategoriesResponse {
  int id;
  List<dynamic> logs;
  String status;
  String message;
  bool error;
  List<String> data;

  CategoriesResponse({
    required this.id,
    required this.logs,
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        id: json["id"],
        logs: List<dynamic>.from(json["logs"].map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logs": List<dynamic>.from(logs.map((x) => x)),
        "status": status,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
