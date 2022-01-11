import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restartQuiz;

  Result(this.resultScore, this.restartQuiz);

  String get resultPhrase {
    var resultText = 'You Did It';
    if (resultScore <= 8) {
      resultText = 'You are Awesome and Innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likable';
    } else if (resultScore <= 16) {
      resultText = 'You are Strange, my guyyyyy';
    } else {
      resultText = 'You Are Soooo bad, lol';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: restartQuiz,
            child: const Text('Restart Quiz'),
            color: Colors.blue,
            textColor: Colors.white
          )
        ],
      ),
    );
  }
}
