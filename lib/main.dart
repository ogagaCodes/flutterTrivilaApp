// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);
  var _questionIndex = 0;
  var _totalScore = 0;



void restartQuiz() {
  setState(() {
    _questionIndex = 0;
    _totalScore = 0;
  });
}
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(' i was pressed..');
  }

  static const _questions = [
    {
      'questionText': 'What\'s your name?',
      'answers': [
        {'text': 'Red', 'score': 8},
        {'text': 'Blue', 'score': 3},
        {'text': 'white', 'score': 1},
        {'text': 'Black', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Rice', 'score': 3},
        {'text': 'Beans', 'score': 1},
        {'text': 'cake', 'score': 2},
        {'text': 'Sand', 'score': 15}
      ]
    },
    {
      'questionText': 'What\'s your pet name?',
      'answers': [
        {'text': 'Bingo', 'score': 4},
        {'text': 'Dark', 'score': 10},
        {'text': 'Alice', 'score': 1},
        {'text': 'Rogger', 'score': 2}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, restartQuiz),
      ),
    );
  }
}
