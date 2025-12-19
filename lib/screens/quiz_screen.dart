import 'package:flutter/material.dart';
import '../models/word.dart';

class QuizScreen extends StatefulWidget {
  final List<Word> words;

  QuizScreen({required this.words});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int score = 0;
  bool showCorrect = false;

  final answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.words.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: Center(child: Text('No words to quiz')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Score: $score',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'What is the meaning of "${widget.words[index].text}"?',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            TextField(
              controller: answerController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Answer',
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                setState(() {
                  if (answerController.text.trim() ==
                      widget.words[index].meaning) {
                    score++;
                    showCorrect = true;
                  } else {
                    showCorrect = false;
                  }

                  answerController.clear();

                  index++;

                  if (index >= widget.words.length) {
                    index = 0;
                    score = 0;
                  }
                });
              },
            ),

            SizedBox(height: 20),

            if (showCorrect)
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
          ],
        ),
      ),
    );
  }
}
