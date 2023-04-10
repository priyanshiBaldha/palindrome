import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Palindrom Or Not",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    var val = value.toString().split('').reversed;

                    setState(() {
                      (val == value)
                          ? ScaffoldMessenger(
                        child: SnackBar(
                          content: Text("This Name is Palindrome"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      )
                          : ScaffoldMessenger(
                        child: SnackBar(
                          content: Text("This Name is Not Palindrome"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    });
                  });
                },
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Your Name"),
                ),
              ),
              IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.check),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
