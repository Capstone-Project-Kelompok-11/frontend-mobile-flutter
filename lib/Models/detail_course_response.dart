// To parse this JSON data, do
//
//     final detailCourseResponse = detailCourseResponseFromJson(jsonString);

import 'dart:convert';

DetailCourseResponse detailCourseResponseFromJson(String str) => DetailCourseResponse.fromJson(json.decode(str));

String detailCourseResponseToJson(DetailCourseResponse data) => json.encode(data.toJson());

class DetailCourseResponse {
    int? id;
    List<dynamic>? logs;
    String? status;
    String? message;
    bool? error;
    DetailCourseResponseData? data;

    DetailCourseResponse({
        this.id,
        this.logs,
        this.status,
        this.message,
        this.error,
        this.data,
    });

    factory DetailCourseResponse.fromJson(Map<String, dynamic> json) => DetailCourseResponse(
        id: json["id"],
        logs: json["logs"] == null ? [] : List<dynamic>.from(json["logs"]!.map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : DetailCourseResponseData.fromJson(json["data"]),
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

class DetailCourseResponseData {
    dynamic categoryCourses;
    List<Checkout>? checkout;
    bool? completion;
    CreateBy? createBy;
    DateTime? createdAt;
    String? description;
    String? document;
    int? finished;
    String? id;
    String? level;
    int? memberCount;
    List<Module>? modules;
    String? name;
    int? price;
    int? rating;
    String? thumbnail;
    DateTime? updateAt;
    String? video;

    DetailCourseResponseData({
        this.categoryCourses,
        this.checkout,
        this.completion,
        this.createBy,
        this.createdAt,
        this.description,
        this.document,
        this.finished,
        this.id,
        this.level,
        this.memberCount,
        this.modules,
        this.name,
        this.price,
        this.rating,
        this.thumbnail,
        this.updateAt,
        this.video,
    });

    factory DetailCourseResponseData.fromJson(Map<String, dynamic> json) => DetailCourseResponseData(
        categoryCourses: json["category_courses"],
        checkout: json["checkout"] == null ? [] : List<Checkout>.from(json["checkout"]!.map((x) => Checkout.fromJson(x))),
        completion: json["completion"],
        createBy: json["create_by"] == null ? null : CreateBy.fromJson(json["create_by"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        description: json["description"],
        document: json["document"],
        finished: json["finished"],
        id: json["id"],
        level: json["level"],
        memberCount: json["member_count"],
        modules: json["modules"] == null ? [] : List<Module>.from(json["modules"]!.map((x) => Module.fromJson(x))),
        name: json["name"],
        price: json["price"],
        rating: json["rating"],
        thumbnail: json["thumbnail"],
        updateAt: json["update_at"] == null ? null : DateTime.parse(json["update_at"]),
        video: json["video"],
    );

    Map<String, dynamic> toJson() => {
        "category_courses": categoryCourses,
        "checkout": checkout == null ? [] : List<dynamic>.from(checkout!.map((x) => x.toJson())),
        "completion": completion,
        "create_by": createBy?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "description": description,
        "document": document,
        "finished": finished,
        "id": id,
        "level": level,
        "member_count": memberCount,
        "modules": modules == null ? [] : List<dynamic>.from(modules!.map((x) => x.toJson())),
        "name": name,
        "price": price,
        "rating": rating,
        "thumbnail": thumbnail,
        "update_at": updateAt?.toIso8601String(),
        "video": video,
    };
}

class Checkout {
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? userId;
    String? courseId;
    String? paymentMethod;
    bool? verify;

    Checkout({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.userId,
        this.courseId,
        this.paymentMethod,
        this.verify,
    });

    factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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

class CreateBy {
    String? image;
    String? name;
    String? username;

    CreateBy({
        this.image,
        this.name,
        this.username,
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

class Module {
    bool? completion;
    ModuleData? data;

    Module({
        this.completion,
        this.data,
    });

    factory Module.fromJson(Map<String, dynamic> json) => Module(
        completion: json["completion"],
        data: json["data"] == null ? null : ModuleData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "completion": completion,
        "data": data?.toJson(),
    };
}

class ModuleData {
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? courseId;
    String? name;
    String? description;
    String? thumbnail;
    String? video;
    String? document;
    dynamic quizzes;
    dynamic completionModules;

    ModuleData({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.courseId,
        this.name,
        this.description,
        this.thumbnail,
        this.video,
        this.document,
        this.quizzes,
        this.completionModules,
    });

    factory ModuleData.fromJson(Map<String, dynamic> json) => ModuleData(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        courseId: json["course_id"],
        name: json["name"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        video: json["video"],
        document: json["document"],
        quizzes: json["quizzes"],
        completionModules: json["completion_modules"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "course_id": courseId,
        "name": name,
        "description": description,
        "thumbnail": thumbnail,
        "video": video,
        "document": document,
        "quizzes": quizzes,
        "completion_modules": completionModules,
    };
}
