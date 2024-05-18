import 'package:flutter/material.dart';
import 'package:lms_apps/Services/get_quiz_service.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/quiz_view_model.dart';
import 'package:provider/provider.dart';

import '../../../Models/quisesanswer_request_response.dart';
import '../../../Models/quiz_response.dart';

class QuizBody extends StatefulWidget {
  final String moduleId;
  const QuizBody({super.key, required this.moduleId});

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int setIndex = 0;
  @override
  void initState() {
    quiz = Provider.of<QuizViewModel>(context, listen: false);
    quiz?.getQuizes(widget.moduleId);
    super.initState();
  }

  QuizViewModel? quiz;
  @override
  Widget build(BuildContext context) {
    // final quiz = Provider.of<QuizViewModel>(context);
    // // List<Quiz> quiz = [
    // //   Quiz(question: 'Jam berapa matahari terbit?', choices: [
    // //     Choice(text: 'jam 4', valid: false),
    // //     Choice(text: 'jam 5', valid: false),
    // //     Choice(text: 'jam 6', valid: false),
    // //     Choice(text: 'jam 2', valid: false),
    // //   ]),
    // //   Quiz(question: 'kapan saya lahir?', choices: [
    // //     Choice(text: '24 oktober', valid: false),
    // //     Choice(text: '21 oktober', valid: false),
    // //     Choice(text: '22 oktober', valid: false),
    // //     Choice(text: '23 oktober', valid: false),
    // //   ]),
    // //   Quiz(question: 'siapa nama saya?', choices: [
    // //     Choice(text: 'gtw', valid: false),
    // //     Choice(text: 'tanya bunda', valid: false),
    // //     Choice(text: 'maybe', valid: false),
    // //     Choice(text: 'IKD', valid: false),
    // //   ]),
    // //   Quiz(question: 'nama saya?', choices: [
    // //     Choice(text: 'gtw', valid: false),
    // //     Choice(text: 'tanya bunda', valid: false),
    // //     Choice(text: 'maybe', valid: false),
    // //     Choice(text: 'IKD', valid: false),
    // //   ]),
    // //   Quiz(question: 'siapa nama saya?', choices: [
    // //     Choice(text: 'gtw', valid: false),
    // //     Choice(text: 'tanya bunda', valid: false),
    // //     Choice(text: 'maybe', valid: false),
    // //     Choice(text: 'IKD', valid: false),
    // //   ]),
    // //   Quiz(question: 'siapa nama saya?', choices: [
    // //     Choice(text: 'gtw', valid: false),
    // //     Choice(text: 'tanya bunda', valid: false),
    // //     Choice(text: 'maybe', valid: false),
    // //     Choice(text: 'IKD', valid: false),
    // //   ]),
    // //   Quiz(question: 'siapa nama saya?', choices: [
    // //     Choice(text: 'gtw', valid: false),
    // //     Choice(text: 'tanya bunda', valid: false),
    // //     Choice(text: 'maybe', valid: false),
    // //     Choice(text: 'IKD', valid: false),
    // //   ]),
    // ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/Rectangle 26.png'),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: quiz?.quizes.length,
                itemBuilder: (context, questionIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quiz?.quizes[questionIndex].question ?? '',
                        style: blackTextStyle.copyWith(
                            fontWeight: bold, fontSize: 14.4),
                      ),
                      const SizedBox(height: 13),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: quiz?.quizes[questionIndex].choices?.length,
                        itemBuilder: (context, choicesIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //   quiz?.selectAnswer(quiz
                                    //       ?.quizes[questionIndex]
                                    //       .choices?[choicesIndex]);
                                    //   quiz?.answerquiz.forEach(
                                    //     (element) {
                                    //       // if (element.)
                                    //       element.choices?.forEach((elementquiz) {
                                    //         if (elementquiz.text ==
                                    //             quiz
                                    //                 ?.quizes[questionIndex]
                                    //                 .choices?[choicesIndex]
                                    //                 .text) {
                                    //           print(
                                    //               '${elementquiz.text} +${elementquiz.valid}');
                                    //           elementquiz.valid = quiz
                                    //               ?.quizes[questionIndex]
                                    //               .choices![choicesIndex]
                                    //               .valid;
                                    //         }
                                    //       });
                                    //     },
                                    //   );

                                    print(quiz?.quizes[questionIndex]
                                        .choices?[choicesIndex].valid);
                                    List<bool> validityValues = List.filled(
                                        quiz!.quizes[questionIndex].choices!
                                            .length,
                                        false);
                                    setIndex = choicesIndex;

                                    if (setIndex >= 0 &&
                                        setIndex <
                                            quiz!.quizes[questionIndex].choices!
                                                .length) {
                                      validityValues[setIndex] = true;
                                    } else {
                                      validityValues[quiz!.quizes[questionIndex]
                                              .choices!.length -
                                          1] = true;
                                    }

                                    for (int i = 0;
                                        i <
                                            quiz!.quizes[questionIndex].choices!
                                                .length;
                                        i++) {
                                      quiz!.quizes[questionIndex].choices?[i]
                                          .valid = validityValues[i];
                                    }

                                    print(validityValues);
                                    print(quiz!.quizes[questionIndex].choices);
                                    // for (int i = 0;
                                    //     i < quiz.quizes.length;
                                    //     i++) {
                                    //   print(quiz.quizes[questionIndex]
                                    //       .choices?[i].valid);
                                    // }
                                    setState(() {});
                                  },
                                  child: quiz!.quizes[questionIndex]
                                              .choices?[choicesIndex].valid ==
                                          true
                                      ? Image.asset(
                                          'assets/images/tick-circle.png',
                                          height: 24,
                                          width: 24,
                                        )
                                      : Image.asset(
                                          'assets/icon/ic_outline.png'),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    quiz!.quizes[questionIndex]
                                            .choices?[choicesIndex].text ??
                                        '',
                                    style: blackTextStyle.copyWith(
                                        fontWeight: small, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 13),
                    ],
                  );
                },
              ),
              // IconButton(
              //   onPressed: () async {
              //     // quiz?.answerquiz.first.choices?.first.text;
              //     print(
              //         '${quiz?.answerquiz.first.choices?.first.text}) + ${quiz?.answerquiz.first.choices?.first.valid}');
              //     await QuizService().postQuiz(
              //         widget.moduleId, QuizResponse(data: quiz?.answerquiz));
              //     // QuizzesAnswerRequest? requestanswer;
              //     // requestanswer!.quizzes = quiz?.answerquiz ?? [];
              //     // quiz?.answerquiz.forEach((element) {
              //     //   print(element.);
              //     // });
              //   },
              //   icon: const Icon(Icons.abc),
              // )
            ],
          )
        ],
      ),
    );
  }
}
