import 'package:flutter/material.dart';
import '../model/question_page.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  final Function(int, int, bool) onAnswerSelected;

  QuestionWidget({
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  List<int?> _selectedAnswerIndexes = List.filled(4, null); // Adjust the size according to the maximum number of options

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            widget.question.questionText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: widget.question.options.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            final isSelected = _selectedAnswerIndexes[index] != null;
            final isCorrect = index == widget.question.correctAnswerIndex;
            // print(isCorrect);

            print('Option: $option, Is Correct: $isCorrect');

            return GestureDetector(
              onTap: () {
                setState(() {
                  // Deselect all other options
                  _selectedAnswerIndexes = List.filled(widget.question.options.length, null);
                  // Select the current option
                  _selectedAnswerIndexes[index] = index;
                });
                widget.onAnswerSelected(index, _selectedAnswerIndexes[index]!, isCorrect);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected
                      ? (isCorrect ? Colors.blue.withOpacity(0.1) : Colors.red.withOpacity(0.1))
                      : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? (isCorrect ? Colors.blue : Colors.red) : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      isSelected ? (isCorrect ? Icons.check_circle : Icons.cancel) : Icons.radio_button_unchecked,
                      color: isSelected ? (isCorrect ? Colors.blue : Colors.red) : Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? (isCorrect ? Colors.blue : Colors.red) : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
