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

  bool answered = false;
  bool isCorrect = false;

  String correctAnswer = '';

  final TextEditingController answerController = TextEditingController();

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // السؤال
            Text(
              'What is the meaning of "${widget.words[index].text}"?',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 20),

            // الإجابة
            TextField(
              controller: answerController,
              enabled: !answered,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Answer',
              ),
            ),

            SizedBox(height: 20),

            // زر Submit
            ElevatedButton(
              onPressed: answered
                  ? null
                  : () {
                      setState(() {
                        answered = true;

                        if (answerController.text.trim() ==
                            widget.words[index].meaning) {
                          score++;
                          isCorrect = true;
                        } else {
                          isCorrect = false;
                          correctAnswer = widget.words[index].meaning;
                        }
                      });
                    },
              child: Text('Submit'),
            ),

            SizedBox(height: 20),

            // Feedback
            if (answered && isCorrect)
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),

            if (answered && !isCorrect) ...[
              Icon(
                Icons.cancel,
                color: Colors.red,
                size: 50,
              ),
              SizedBox(height: 10),
              Text(
                'Correct answer: $correctAnswer',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],

            Spacer(),

            // زر Next
            if (answered)
              ElevatedButton(
                onPressed: () {
                  if (index == widget.words.length - 1) {
                    _showResultDialog();
                  } else {
                    setState(() {
                      index++;
                      answered = false;
                      isCorrect = false;
                      answerController.clear();
                    });
                  }
                },
                child: Text('Next'),
              ),
          ],
        ),
      ),
    );
  }

  // 🟦 Dialog النتيجة
  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Center(
          child: Text(
            'Quiz Finished 🎉',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.emoji_events,
              color: Colors.amber,
              size: 60,
            ),
            SizedBox(height: 10),
            Text(
              'Your Score',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              '$score / ${widget.words.length}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // يقفل الـ dialog
                Navigator.pop(context); // يطلع من صفحة الـ quiz
              },
              child: Text('Exit'),
            ),
          )
        ],
      ),
    );
  }
}
