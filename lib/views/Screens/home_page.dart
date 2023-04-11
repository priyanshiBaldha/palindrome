import 'package:flutter/material.dart';


class PalindromePage extends StatefulWidget {
  @override
  _PalindromePageState createState() => _PalindromePageState();
}

class _PalindromePageState extends State<PalindromePage> {
  String inputText = '';

  bool isPalindrome(String text) {
    List<String> characters = text.split("");
    List<String> reversedCharacters = characters.reversed.toList();
    String reversedText = reversedCharacters.join("");
    return text == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palindrome Checker'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  setState(() {
                    inputText = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a string',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (isPalindrome(inputText)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Result'),
                          content: Text('The string is a palindrome.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Result'),
                          content: Text('The string is not a palindrome.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Check'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}