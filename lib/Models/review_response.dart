// To parse this JSON data, do
//
//     final reviewResponse = reviewResponseFromJson(jsonString);

import 'dart:convert';

ReviewResponse reviewResponseFromJson(String str) => ReviewResponse.fromJson(json.decode(str));

String reviewResponseToJson(ReviewResponse data) => json.encode(data.toJson());

class ReviewResponse {
    int id;
    List<dynamic> logs;
    String status;
    String message;
    bool error;
    List<ReviewData> data;

    ReviewResponse({
        required this.id,
        required this.logs,
        required this.status,
        required this.message,
        required this.error,
        required this.data,
    });

    factory ReviewResponse.fromJson(Map<String, dynamic> json) => ReviewResponse(
        id: json["id"],
        logs: List<dynamic>.from(json["logs"].map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: List<ReviewData>.from(json["data"].map((x) => ReviewData.fromJson(x))),
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

class ReviewData {
    String comment;
    String id;
    int rating;
    User user;

    ReviewData({
        required this.comment,
        required this.id,
        required this.rating,
        required this.user,
    });

    factory ReviewData.fromJson(Map<String, dynamic> json) => ReviewData(
        comment: json["comment"],
        id: json["id"],
        rating: json["rating"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "comment": comment,
        "id": id,
        "rating": rating,
        "user": user.toJson(),
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
