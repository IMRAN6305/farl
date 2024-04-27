import 'package:farl/pages/about_page.dart';
import 'package:farl/pages/auth/edit_profile.dart';
import 'package:farl/pages/auth/login_page.dart';
import 'package:farl/pages/auth/registration_page.dart';
import 'package:farl/pages/exam_page.dart';
import 'package:farl/pages/home_page.dart';
import 'package:farl/pages/profile_page.dart';
import 'package:farl/pages/session_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finate Automata and Regular Language',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: HomePage(),
    );
  }
}
