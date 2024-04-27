import 'package:farl/pages/auth/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/auth_page.dart';
import '../home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _email;
  String? _password;
  void initState() {
    super.initState();
    this.checkUserData();
  }



  Future<void> checkUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');

    print(userDataJson);

    if (userDataJson != null) {
      // User data exists, navigate to home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }


  login(){
// var mdata = {"email":_emailController.text,"password":_passwordController.text};


getCurrentUser(email: _emailController.text,password: _passwordController.text).then((_) {

  // Show success message in snackbar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Login successful'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
}).catchError((error) {
  // Show error message in snackbar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Registration failed: $error'),
      duration: Duration(seconds: 2),
    ),
  );
});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F2F5),
      body: Center(
        child: Container(
          height: 500.0,
          width: 500.0,
          child: Center(
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform login logic here
                            this.login();
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text('Logging in...')),
                            // );
                          }
                        },
                        child: Text('Login'),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          // Navigate to registration page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                        },
                        child: Text('Don\'t have an account? Register here'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
