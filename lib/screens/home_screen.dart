import 'package:flutter/material.dart';
import '../models/word.dart';
import 'add_word.dart';
import 'quiz_screen.dart';
import 'flashcard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // ✅ هنا بنعمل List<Word> اللي هتمرر لكل الصفحات
  List<Word> words = [
    Word(text: 'Hola', meaning: 'Hello'),
    Word(text: 'Gracias', meaning: 'Thank you'),
    Word(text: 'Adiós', meaning: 'Goodbye'),
    Word(text: 'Por favor', meaning: 'Please'),
    Word(text: 'Amor', meaning: 'Love'),
    Word(text: 'Casa', meaning: 'House'),
    Word(text: 'Agua', meaning: 'Water'),
    Word(text: 'Libro', meaning: 'Book'),
    Word(text: 'Amigo', meaning: 'Friend'),
    Word(text: 'Escuela', meaning: 'School'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Language Flashcards App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                
                onPressed: () {
                  // ➡️ تمرير ال List للـ QuizScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(words: words),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(160, 40)),
                child: Text('Start Quiz'),
                
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // ➡️ تمرير ال List للـ FlashcardsScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FlashcardScreen(words: words),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(160, 40)),
                child: Text('View Flashcards'),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // ➡️ تمرير ال List للـ AddWordScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddWordScreen(words: words),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(160, 40)),
                child: Text('Add New Word'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
