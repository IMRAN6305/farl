import 'package:flutter/material.dart';

class ContextPage extends StatelessWidget {
  final String heading;
  ContextPage({required this.heading});
  var mdata = {
    '0':
        '''Finite Automata are a fundamental concept in computer science and theoretical computer science, particularly in the field of automata theory. They are mathematical models used to represent and analyze the behavior of systems that have a finite number of states and operate on input symbols from a finite alphabet. These systems are often used to model various computational processes or systems with discrete state transitions.

Finite Automata can be classified into several types based on their capabilities and structures, such as Deterministic Finite Automata (DFA), Non-deterministic Finite Automata (NFA), and Finite State Transducers (FST), among others. They find applications in various areas of computer science, including formal language theory, compiler design, parsing, pattern matching, and digital circuit design.

Understanding Finite Automata and their properties is crucial for designing efficient algorithms, developing software systems, and solving problems related to computational processes and language recognition.'''
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.8),
          title: Text(
            'Logo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${heading}",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                '''
          ${mdata['data']}
          
          ''',
                style: TextStyle(fontSize: 21.0),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ));
  }
}
