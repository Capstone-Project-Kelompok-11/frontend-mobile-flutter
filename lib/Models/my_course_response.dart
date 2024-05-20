// To parse this JSON data, do
//
//     final myCourseResponse = myCourseResponseFromJson(jsonString);

import 'dart:convert';

import 'package:lms_apps/Models/detail_course_response.dart';

MyCourseResponse myCourseResponseFromJson(String str) =>
    MyCourseResponse.fromJson(json.decode(str));

String myCourseResponseToJson(MyCourseResponse data) =>
    json.encode(data.toJson());

class MyCourseResponse {
  int? id;
  List<dynamic>? logs;
  String? status;
  String? message;
  bool? error;
  List<Datum>? data;

  MyCourseResponse({
    this.id,
    this.logs,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory MyCourseResponse.fromJson(Map<String, dynamic> json) =>
      MyCourseResponse(
        id: json["id"],
        logs: json["logs"] == null
            ? []
            : List<dynamic>.from(json["logs"]!.map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logs": logs == null ? [] : List<dynamic>.from(logs!.map((x) => x)),
        "status": status,
        "message": message,
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Iterable<Module>? completeModule;
  List<Module>? lessonLength;
  bool? cancel;
  Course? course;
  DateTime? createdAt;
  Data? data;
  dynamic deletedAt;
  String? id;
  bool? paid;
  String? paymentMethod;
  DateTime? updateAt;
  User? user;

  Datum({
    this.completeModule,
    this.lessonLength,
    this.cancel,
    this.course,
    this.createdAt,
    this.data,
    this.deletedAt,
    this.id,
    this.paid,
    this.paymentMethod,
    this.updateAt,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cancel: json["cancel"],
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        deletedAt: json["deleted_at"],
        id: json["id"],
        paid: json["paid"],
        paymentMethod: json["payment_method"],
        updateAt: json["update_at"] == null
            ? null
            : DateTime.parse(json["update_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "cancel": cancel,
        "course": course?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "data": data?.toJson(),
        "deleted_at": deletedAt,
        "id": id,
        "paid": paid,
        "payment_method": paymentMethod,
        "update_at": updateAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class Course {
  String? id;
  String? name;
  // int? price;
  String? thumbnail;

  Course({
    this.id,
    this.name,
    // this.price,
    this.thumbnail,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        // price: json["price"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "price": price,
        "thumbnail": thumbnail,
      };
}

class Data {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? userId;
  String? courseId;
  String? paymentMethod;
  bool? verify;

  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userId,
    this.courseId,
    this.paymentMethod,
    this.verify,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userId: json["user_id"],
        courseId: json["course_id"],
        paymentMethod: json["payment_method"],
        verify: json["verify"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "user_id": userId,
        "course_id": courseId,
        "payment_method": paymentMethod,
        "verify": verify,
      };
}

class User {
  String? id;
  String? image;
  String? name;
  String? username;

  User({
    this.id,
    this.image,
    this.name,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "username": username,
      };
}
