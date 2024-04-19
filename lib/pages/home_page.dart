import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.supervised_user_circle_outlined),
         title: Text('Welcome to My page'),

      ),
    );
  }
}