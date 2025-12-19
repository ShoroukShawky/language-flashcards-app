import 'package:flutter/material.dart';
import '../models/word.dart';

class FlashcardScreen extends StatefulWidget {
  final List<Word> words;

  FlashcardScreen({required this.words});

  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int index = 0;
  bool showMeaning = false;

  @override
  Widget build(BuildContext context) {
    if (widget.words.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Flashcards')),
        body: Center(child: Text('No words added yet')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Flashcards')),
      body: Center(
        
        child: GestureDetector(
          onTap: () {
            setState(() => showMeaning = !showMeaning);
          },
          
          child: Card(
            elevation: 5,
            child: Container(
              width: 350,
              height: 240,
              alignment: Alignment.center,
              child: Text(
                showMeaning
                    ? widget.words[index].meaning
                    : widget.words[index].text,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing:15 ,
        children: [
          FloatingActionButton(
            child: Icon(Icons.navigate_before),
            onPressed: () {
              setState(() {
                index = (index - 1) % widget.words.length;
                showMeaning = false;
              });
            },
          ),
          Text('${index+1}/${widget.words.length}'),
          FloatingActionButton(
            child: Icon(Icons.navigate_next),
            onPressed: () {
              setState(() {
                index = (index + 1) % widget.words.length;
                showMeaning = false;
              });
            },
          ),
          
        ],
      ),
    );
  }
}
