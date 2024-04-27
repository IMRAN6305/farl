import 'dart:convert';

import 'package:farl/pages/auth/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'about_page.dart';
import 'auth/login_page.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   String? userName;

    String? userEmail;

    String? userDOB;


  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');
    print("Proile page,$userDataJson");
    if (userDataJson != null) {
      final userData = json.decode(userDataJson);


      setState(() {
       this. userName =" ${userData['first_name'] } ${userData['last_name']}";
        this.userEmail = userData['email'];
       // DateTime dateTime =userData['date_of_birth'];
       // String formattedDOB = "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
        this.userDOB = userData['date_of_birth'].replaceAll("00:00:00.000","");
      });
    }
    else{
      this. userName = '--';
      this.userEmail =  '--';
      this.userDOB =  '--';
    }
  }

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
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutPage(),));

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
              onTap: () {
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        userName!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        userEmail!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      leading: Icon(Icons.cake),
                      title: Text(
                        'Date of Birth',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        userDOB!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer(), // To push buttons to the bottom
            SizedBox(height: 100.0,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 40),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white

                  ),
                  onPressed: () {
                    // Navigate to edit profile page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(),));
                  },
                  child: Text('Edit'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 40),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white

                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

