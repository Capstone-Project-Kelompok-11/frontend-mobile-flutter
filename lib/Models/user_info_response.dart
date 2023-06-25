import 'dart:convert';

UsersInformationResponse usersInformationResponseFromJson(String str) =>
    UsersInformationResponse.fromJson(json.decode(str));

String usersInformationResponseToJson(UsersInformationResponse data) =>
    json.encode(data.toJson());

class UsersInformationResponse {
  int? id;
  List<dynamic>? logs;
  String? status;
  String? message;
  bool? error;
  Data? data;

  UsersInformationResponse({
    this.id,
    this.logs,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory UsersInformationResponse.fromJson(Map<String, dynamic> json) =>
      UsersInformationResponse(
        id: json["id"],
        logs: json["logs"] == null
            ? []
            : List<dynamic>.from(json["logs"]!.map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logs": logs == null ? [] : List<dynamic>.from(logs!.map((x) => x)),
        "status": status,
        "message": message,
        "error": error,
        "data": data?.toJson(),
      };
}

class Data {
  String? address;
  bool? admin;
  int? balance;
  String? city;
  String? countryCode;
  DateTime? dob;
  String? email;
  String? gender;
  String? image;
  String? name;
  String? phone;
  String? postalCode;
  String? username;
  bool? verify;
  String? confirmPassword;

  Data({
    this.address,
    this.admin,
    this.balance,
    this.city,
    this.countryCode,
    this.dob,
    this.email,
    this.gender,
    this.image,
    this.name,
    this.phone,
    this.postalCode,
    this.username,
    this.verify,
    this.confirmPassword,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        address: json["address"],
        admin: json["admin"],
        balance: json["balance"],
        city: json["city"],
        countryCode: json["country_code"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        email: json["email"],
        gender: json["gender"],
        image: json["image"],
        name: json["name"],
        phone: json["phone"],
        postalCode: json["postal_code"],
        username: json["username"],
        verify: json["verify"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "admin": admin,
        "balance": balance,
        "city": city,
        "country_code": countryCode,
        "dob": dob?.toIso8601String(),
        "email": email,
        "gender": gender,
        "image": image,
        "name": name,
        "phone": phone,
        "postal_code": postalCode,
        "username": username,
        "verify": verify,
        "confirm_password": confirmPassword,
      };
}
