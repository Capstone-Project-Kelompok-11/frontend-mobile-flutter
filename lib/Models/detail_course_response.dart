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
        logs: List<dynamic>.from(json["logs"].map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: DetailCourseResponseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logs": List<dynamic>.from(logs!.map((x) => x)),
        "status": status,
        "message": message,
        "error": error,
        "data": data?.toJson(),
    };
}

class DetailCourseResponseData {
    List<dynamic>? categories;
    List<dynamic>? checkout;
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
    int? rating1;
    int? rating2;
    int? rating3;
    int? rating4;
    int? rating5;
    int? ratingN;
    String? thumbnail;
    DateTime? updateAt;
    String? video;

    DetailCourseResponseData({
         this.categories,
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
         this.rating1,
         this.rating2,
         this.rating3,
         this.rating4,
         this.rating5,
         this.ratingN,
         this.thumbnail,
         this.updateAt,
         this.video,
    });

    factory DetailCourseResponseData.fromJson(Map<String, dynamic> json) => DetailCourseResponseData(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        checkout: List<dynamic>.from(json["checkout"].map((x) => x)),
        completion: json["completion"],
        createBy: CreateBy.fromJson(json["create_by"]),
        createdAt: DateTime.parse(json["created_at"]),
        description: json["description"],
        document: json["document"],
        finished: json["finished"],
        id: json["id"],
        level: json["level"],
        memberCount: json["member_count"],
        modules: List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
        name: json["name"],
        price: json["price"],
        rating: json["rating"],
        rating1: json["rating1"],
        rating2: json["rating2"],
        rating3: json["rating3"],
        rating4: json["rating4"],
        rating5: json["rating5"],
        ratingN: json["ratingN"],
        thumbnail: json["thumbnail"],
        updateAt: DateTime.parse(json["update_at"]),
        video: json["video"],
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "checkout": List<dynamic>.from(checkout!.map((x) => x)),
        "completion": completion,
        "create_by": createBy?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "description": description,
        "document": document,
        "finished": finished,
        "id": id,
        "level": level,
        "member_count": memberCount,
        "modules": List<dynamic>.from(modules!.map((x) => x.toJson())),
        "name": name,
        "price": price,
        "rating": rating,
        "rating1": rating1,
        "rating2": rating2,
        "rating3": rating3,
        "rating4": rating4,
        "rating5": rating5,
        "ratingN": ratingN,
        "thumbnail": thumbnail,
        "update_at": updateAt?.toIso8601String(),
        "video": video,
    };
}

class CreateBy {
    String? image;
    String? name;
    String?username;

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
        data: ModuleData.fromJson(json["data"]),
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
