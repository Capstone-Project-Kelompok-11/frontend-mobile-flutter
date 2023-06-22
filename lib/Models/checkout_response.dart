// To parse this JSON data, do
//
//     final checkOutResponse = checkOutResponseFromJson(jsonString);

import 'dart:convert';

CheckOutResponse checkOutResponseFromJson(String str) =>
    CheckOutResponse.fromJson(json.decode(str));

String checkOutResponseToJson(CheckOutResponse data) =>
    json.encode(data.toJson());

class CheckOutResponse {
  int id;
  List<dynamic> logs;
  String status;
  String message;
  bool error;
  List<CheckOut> data;

  CheckOutResponse({
    required this.id,
    required this.logs,
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });

  factory CheckOutResponse.fromJson(Map<String, dynamic> json) =>
      CheckOutResponse(
        id: json["id"],
        logs: List<dynamic>.from(json["logs"].map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: List<CheckOut>.from(json["data"].map((x) => CheckOut.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logs": List<dynamic>.from(logs.map((x) => x)),
        "status": status,
        "message": message,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CheckOut {
  bool cancel;
  Course course;
  DateTime createdAt;
  dynamic deletedAt;
  String id;
  bool paid;
  String paymentMethod;
  DateTime updateAt;
  User user;

  CheckOut({
    required this.cancel,
    required this.course,
    required this.createdAt,
    this.deletedAt,
    required this.id,
    required this.paid,
    required this.paymentMethod,
    required this.updateAt,
    required this.user,
  });

  factory CheckOut.fromJson(Map<String, dynamic> json) => CheckOut(
        cancel: json["cancel"],
        course: Course.fromJson(json["course"]),
        createdAt: DateTime.parse(json["created_at"]),
        deletedAt: json["deleted_at"],
        id: json["id"],
        paid: json["paid"],
        paymentMethod: json["payment_method"],
        updateAt: DateTime.parse(json["update_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "cancel": cancel,
        "course": course.toJson(),
        "created_at": createdAt.toIso8601String(),
        "deleted_at": deletedAt,
        "id": id,
        "paid": paid,
        "payment_method": paymentMethod,
        "update_at": updateAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class Course {
  String id;
  String name;
  int price;
  String thumbnail;

  Course({
    required this.id,
    required this.name,
    required this.price,
    required this.thumbnail,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "thumbnail": thumbnail,
      };
}

class User {
  String image;
  String name;
  String username;

  User({
    required this.image,
    required this.name,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        image: json["image"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "username": username,
      };
}
