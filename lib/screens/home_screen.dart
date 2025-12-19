import 'package:flutter/material.dart';
import 'flashcard_screen.dart';
import 'add_word.dart';
import 'quiz_screen.dart';
import '../models/word.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Word> words = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Language Flashcards')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Learn Flashcards'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FlashcardScreen(words: words),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('Add New Word'),
              onPressed: () async {
                final newWord = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddWordScreen()),
                );
                if (newWord != null) {
                  setState(() => words.add(newWord));
                }
              },
            ),
            ElevatedButton(
              child: Text('Quiz Mode'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(words: words),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
