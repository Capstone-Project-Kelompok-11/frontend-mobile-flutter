// To parse this JSON data, do
//
//     final quizzesAnswerRequest = quizzesAnswerRequestFromJson(jsonString);

import 'dart:convert';

QuizzesAnswerRequest quizzesAnswerRequestFromJson(String str) =>
    QuizzesAnswerRequest.fromJson(json.decode(str));

String quizzesAnswerRequestToJson(QuizzesAnswerRequest data) =>
    json.encode(data.toJson());

class QuizzesAnswerRequest {
  List<Quiz> quizzes;

  QuizzesAnswerRequest({
    required this.quizzes,
  });

  factory QuizzesAnswerRequest.fromJson(Map<String, dynamic> json) =>
      QuizzesAnswerRequest(
        quizzes: List<Quiz>.from(json["quizzes"].map((x) => Quiz.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quizzes": List<dynamic>.from(quizzes.map((x) => x.toJson())),
      };
}

class Quiz {
  String question;
  List<Choice> choices;

  Quiz({
    required this.question,
    required this.choices,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        question: json["question"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
      };
}

class Choice {
  String text;
  bool valid;

  Choice({
    required this.text,
    required this.valid,
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
