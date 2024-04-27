import 'package:flutter/material.dart';

class ExamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question 1:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'What is the capital of France?',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildOption('A', 'London'),
                buildOption('B', 'Paris'),
                buildOption('C', 'Rome'),
                buildOption('D', 'Berlin'),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(

                    onPressed: () {
                      // Cancel button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      fixedSize: Size(100,40)
                    ),
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Next button action
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(100,40)
                    ),
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(String option, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: false,
            shape: CircleBorder(),
            onChanged: (bool? value) {
              // Handle checkbox state change
            },
          ),
          Text(
            '$option. $text',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}


