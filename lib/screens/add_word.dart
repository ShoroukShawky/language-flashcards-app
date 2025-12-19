import 'package:flutter/material.dart';
import '../models/word.dart';

class AddWordScreen extends StatefulWidget {
  final List<Word> words;

  AddWordScreen({required this.words});

  @override
  _AddWordScreenState createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final TextEditingController wordController = TextEditingController();
  final TextEditingController meaningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Word'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: wordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Word (Spanish)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: meaningController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Meaning (English)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String newWord = wordController.text.trim();
                String newMeaning = meaningController.text.trim();

                if (newWord.isEmpty || newMeaning.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill both fields')),
                  );
                  return;
                }

                // ✅ التحقق من وجود الكلمة مسبقًا
                bool exists = widget.words.any((w) => w.text.toLowerCase() == newWord.toLowerCase());

                if (exists) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('This word already exists!')),
                  );
                  return;
                }

                // لو مش موجودة → اضيفيها
                setState(() {
                  widget.words.add(Word(text: newWord, meaning: newMeaning));
                });

                // Dialog بعد الحفظ
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => AlertDialog(
                    title: Text('Success!'),
                    content: Text('Word added successfully.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          // Add another word
                          wordController.clear();
                          meaningController.clear();
                          Navigator.pop(context);
                        },
                        child: Text('Add Another'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // close dialog
                          Navigator.pop(context); // go back to Home
                        },
                        child: Text('Exit'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
