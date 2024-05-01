import 'package:flutter/material.dart';
import '../model/question_page.dart';
import 'data.dart';

class ExamPage extends StatefulWidget {
  final String sprint;
  final int session;

  ExamPage({required this.sprint, required this.session});

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [];
  bool _isOptionSelected = false;
  List<int?> _selectedAnswerIndexes = List.filled(4, null);

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    int index=0;
    _questions = (mdata[widget.sprint]!["session"] as List)[widget.session]['exam']
        .map<Question>(
          (exam) {
        // Extracting question text and options
        String questionText = exam.keys.first;
        List<String> options = exam.values.first.cast<String>();

        // Finding the correct answer text
        String correctAnswerText = (mdata[widget.sprint]!["session"] as List)[widget.session]['answers'][(index + 1).toString()];
        index++;
        print("correct answer$correctAnswerText");

        // Finding the correct answer index based on the text
        int correctAnswerIndex = options.indexWhere((option) => option == correctAnswerText);

        return Question(
          questionText: questionText,
          options: options,
          correctAnswerIndex: correctAnswerIndex,
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question ${_currentQuestionIndex + 1}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          _questions[_currentQuestionIndex].questionText,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: _questions[_currentQuestionIndex].options.asMap().entries.map((entry) {
                          final index = entry.key;
                          final option = entry.value;
                          final isSelected = _selectedAnswerIndexes[index] != null;
                          final isCorrect = index == _questions[_currentQuestionIndex].correctAnswerIndex;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                // Deselect all other options
                                _selectedAnswerIndexes = List.filled(_questions[_currentQuestionIndex].options.length, null);
                                // Select the current option
                                _selectedAnswerIndexes[index] = index;
                              });
                              _onAnswerSelected(index, _selectedAnswerIndexes[index]!, isCorrect);
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
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _currentQuestionIndex > 0 ? _previousQuestion : null,
                    child: Text('Previous'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200.0, 50.0),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _isOptionSelected ? _nextQuestion : null,
                    child: Text(_currentQuestionIndex < _questions.length - 1 ? 'Next' : 'Completed'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      fixedSize: Size(200.0, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAnswerSelected(int selectedAnswerIndex, int selectedOptionIndex, bool isCorrect) {
    setState(() {
      _isOptionSelected = true;
    });
    // Handle answer selection logic here
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestionIndex--;
      _isOptionSelected = false; // Reset option selection
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _isOptionSelected = false; // Reset option selection
        _selectedAnswerIndexes = List.filled(4, null); // Deselect all other options
      } else {
        // Handle end of questions
        // For example, you can navigate to a result page or show a dialog
        // Here, I'm just changing the text of the button to "Completed"
      }
    });
  }
}
