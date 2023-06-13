// To parse this JSON data, do
//
//     final popularCourseResponse = popularCourseResponseFromJson(jsonString);

import 'dart:convert';

PopularCourseResponse popularCourseResponseFromJson(String str) => PopularCourseResponse.fromJson(json.decode(str));

String popularCourseResponseToJson(PopularCourseResponse data) => json.encode(data.toJson());

class PopularCourseResponse {
    int id;
    List<dynamic> logs;
    String status;
    String message;
    bool error;
    List<PopularCourse> data;

    PopularCourseResponse({
        required this.id,
        required this.logs,
        required this.status,
        required this.message,
        required this.error,
        required this.data,
    });

    factory PopularCourseResponse.fromJson(Map<String, dynamic> json) => PopularCourseResponse(
        id: json["id"],
        logs: List<dynamic>.from(json["logs"].map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: List<PopularCourse>.from(json["data"].map((x) => PopularCourse.fromJson(x))),
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

class PopularCourse {
    List<dynamic> categories;
    CreateBy createBy;
    DateTime createdAt;
    String description;
    String document;
    int finished;
    String id;
    String level;
    int memberCount;
    String name;
    int price;
    int rating;
    String thumbnail;
    DateTime updateAt;
    String video;

    PopularCourse({
        required this.categories,
        required this.createBy,
        required this.createdAt,
        required this.description,
        required this.document,
        required this.finished,
        required this.id,
        required this.level,
        required this.memberCount,
        required this.name,
        required this.price,
        required this.rating,
        required this.thumbnail,
        required this.updateAt,
        required this.video,
    });

    factory PopularCourse.fromJson(Map<String, dynamic> json) => PopularCourse(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        createBy: CreateBy.fromJson(json["create_by"]),
        createdAt: DateTime.parse(json["created_at"]),
        description: json["description"],
        document: json["document"],
        finished: json["finished"],
        id: json["id"],
        level: json["level"],
        memberCount: json["member_count"],
        name: json["name"],
        price: json["price"],
        rating: json["rating"],
        thumbnail: json["thumbnail"],
        updateAt: DateTime.parse(json["update_at"]),
        video: json["video"],
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "create_by": createBy.toJson(),
        "created_at": createdAt.toIso8601String(),
        "description": description,
        "document": document,
        "finished": finished,
        "id": id,
        "level": level,
        "member_count": memberCount,
        "name": name,
        "price": price,
        "rating": rating,
        "thumbnail": thumbnail,
        "update_at": updateAt.toIso8601String(),
        "video": video,
    };
}

class CreateBy {
    String image;
    String name;
    String username;

    CreateBy({
        required this.image,
        required this.name,
        required this.username,
    });

    factory CreateBy.fromJson(Map<String, dynamic> json) => CreateBy(
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
