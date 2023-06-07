// To parse this JSON data, do
//
//     final quizResponse = quizResponseFromJson(jsonString);

import 'dart:convert';

QuizResponse quizResponseFromJson(String str) =>
    QuizResponse.fromJson(json.decode(str));

String quizResponseToJson(QuizResponse data) => json.encode(data.toJson());

class QuizResponse {
  List<Quiz>? quizzes;

  QuizResponse({
    this.quizzes,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
        quizzes: json["quizzes"] == null
            ? []
            : List<Quiz>.from(json["quizzes"]!.map((x) => Quiz.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quizzes": quizzes == null
            ? []
            : List<dynamic>.from(quizzes!.map((x) => x.toJson())),
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
