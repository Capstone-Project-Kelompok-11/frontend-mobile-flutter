// To parse this JSON data, do
//
//     final bannerResponse = bannerResponseFromJson(jsonString);

import 'dart:convert';

BannerResponse bannerResponseFromJson(String str) => BannerResponse.fromJson(json.decode(str));

String bannerResponseToJson(BannerResponse data) => json.encode(data.toJson());

class BannerResponse {
    int id;
    List<dynamic> logs;
    String status;
    String message;
    bool error;
    List<BannerImage> data;

    BannerResponse({
        required this.id,
        required this.logs,
        required this.status,
        required this.message,
        required this.error,
        required this.data,
    });

    factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
        id: json["id"],
        logs: List<dynamic>.from(json["logs"].map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: List<BannerImage>.from(json["data"].map((x) => BannerImage.fromJson(x))),
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

class BannerImage {
    String alt;
    String id;
    String src;

    BannerImage({
        required this.alt,
        required this.id,
        required this.src,
    });

    factory BannerImage.fromJson(Map<String, dynamic> json) => BannerImage(
        alt: json["alt"],
        id: json["id"],
        src: json["src"],
    );

    Map<String, dynamic> toJson() => {
        "alt": alt,
        "id": id,
        "src": src,
    };
}
