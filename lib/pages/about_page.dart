import 'package:farl/pages/home_page.dart';
import 'package:farl/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/login_page.dart';

class AboutPage extends StatelessWidget {
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    // Clear user data from shared preferences
    await prefs.remove('userData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.withOpacity(0.8),
        title: Text(
          'Logo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));

              },
              child: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement
                  (context, MaterialPageRoute(builder: (context) => ProfilePage(),));
              },
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(),));

              },
              child: Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () async{
                await signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false,
                );

              },
              child: Text(
                'SignOut',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/automata_image.jpg', // Replace 'assets/automata_image.jpg' with the path to your image
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'About Finite Automata and Regular Languages',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Finite Automata:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Finite Automata, or Finite State Machines, are mathematical models used to represent and analyze the behavior of systems that can be in only a finite number of states at any given time. They are commonly used in various areas of computer science, including compiler design, software engineering, and artificial intelligence.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Regular Languages:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Regular Languages are a class of formal languages that can be defined by regular expressions or by finite automata. They are important in theoretical computer science and have practical applications in areas such as pattern matching, text processing, and lexical analysis.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'This project aims to explore the concepts of Finite Automata and Regular Languages through interactive examples, visualizations, and educational content.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

