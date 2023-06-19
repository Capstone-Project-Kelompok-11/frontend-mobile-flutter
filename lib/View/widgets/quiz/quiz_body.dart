import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/quiz_view_model.dart';
import 'package:provider/provider.dart';

import '../../../Models/quiz_response.dart';

class QuizBody extends StatefulWidget {
  final String modulId;
  const QuizBody({super.key, required this.modulId});

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  @override
  void initState() {
    Provider.of<QuizViewModel>(context, listen: false)
        .getQuizes(widget.modulId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizViewModel>(context);
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
                itemCount: quiz.quizes.length,
                itemBuilder: (context, questionIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quiz.quizes[questionIndex].question ?? '',
                        style: blackTextStyle.copyWith(
                            fontWeight: bold, fontSize: 14.4),
                      ),
                      const SizedBox(height: 13),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: quiz.quizes[questionIndex].choices?.length,
                        itemBuilder: (context, choicesIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              quiz.quizes[questionIndex].choices?[choicesIndex]
                                      .text ??
                                  '',
                              style: blackTextStyle.copyWith(
                                  fontWeight: small, fontSize: 12),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 13),
                    ],
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
