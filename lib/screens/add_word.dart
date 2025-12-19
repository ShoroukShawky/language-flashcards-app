import 'package:flutter/material.dart';
import '../models/word.dart';

class AddWordScreen extends StatelessWidget {
  final wordController = TextEditingController();
  final meaningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Word')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: wordController,
              decoration: InputDecoration(labelText: 'Word'),
            ),
            TextField(
              controller: meaningController,
              decoration: InputDecoration(labelText: 'Meaning'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.pop(
                  context,
                  Word(
                    text: wordController.text,
                    meaning: meaningController.text,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
