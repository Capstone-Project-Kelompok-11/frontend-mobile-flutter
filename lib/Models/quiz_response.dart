// To parse this JSON data, do
//
//     final quizResponse = quizResponseFromJson(jsonString);

import 'dart:convert';

QuizResponse quizResponseFromJson(String str) =>
    QuizResponse.fromJson(json.decode(str));

String quizResponseToJson(QuizResponse data) => json.encode(data.toJson());

class QuizResponse {
  int? id;
  List<dynamic>? logs;
  String? status;
  String? message;
  bool? error;
  List<Quiz>? data;

  QuizResponse({
    this.id,
    this.logs,
    this.status,
    this.message,
    this.error,
    this.data,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
        id: json["id"],
        logs: json["logs"] == null
            ? []
            : List<dynamic>.from(json["logs"]!.map((x) => x)),
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<Quiz>.from(json["data"]!.map((x) => Quiz.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // "logs": logs == null ? [] : List<dynamic>.from(logs!.map((x) => x)),
        // "status": status,
        // "message": message,
        // "error": error,
        "quizzes": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Quiz {
  String? question;
  List<Choice>? choices;

  Quiz({
    this.question,
    this.choices,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        question: json["question"],
        choices: json["choices"] == null
            ? []
            : List<Choice>.from(
                json["choices"]!.map((x) => Choice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "choices": choices == null
            ? []
            : List<dynamic>.from(choices!.map((x) => x.toJson())),
      };
}

class Choice {
  String? text;
  bool? valid;

  Choice({
    this.text,
    this.valid,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json["text"],
        valid: json["valid"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "valid": valid,
      };
}
