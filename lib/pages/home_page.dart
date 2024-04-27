import 'package:farl/pages/about_page.dart';
import 'package:farl/pages/auth/login_page.dart';
import 'package:farl/pages/profile_page.dart';
import 'package:farl/pages/session_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // List<Map<String, dynamic>> mDate = [
  //   {
  //     'title': "Finite Automata",
  //     "Datetime": "29 Jan - 04 Feb 2024",
  //     "status": "completed"
  //   },
  //   {
  //     'title': "Regular Language",
  //     "Datetime": "29 Jan - 04 Feb 2024",
  //     "status": "completed"
  //   },
  //   {
  //     'title': "Sd-3",
  //     "Datetime": "29 Jan - 04 Feb 2024",
  //     "status": "completed"
  //   },
  //   {
  //     'title': "Sd-4",
  //     "Datetime": "29 Jan - 04 Feb 2024",
  //     "status": "in-progress"
  //   },
  //   {'title': "Sd-5", "Datetime": "29 Jan - 04 Feb 2024", "status": "locked"},
  // ];

  List<Map<String, dynamic>> mDate = [
    {'id' : 1,'title': "Finite Automata", "Datetime": "29 Jan - 04 Feb 2024", "status": "completed"},
    {"id":2,'title': "Regular Languag", "Datetime": "29 Jan - 04 Feb 2024", "status": "completed"}
  ];


  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    // Clear user data from shared preferences
    await prefs.remove('userData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
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
              onTap: () {},
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutPage(),
                    ));
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
              onTap: () async {
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(horizontal: 150.0, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.8),
                  Colors.blue.withOpacity(0.6)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Curriculum Completion:',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      '40.0%',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                LinearProgressIndicator(
                  minHeight: 10.0,
                  value: 0.4,
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Session(id:0),
                          ));
                    },
                    child: Text(
                      "Let's Go",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 150.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.hourglass_bottom,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Sprint Sequence',
                        style: TextStyle(fontSize: 21),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mDate.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 1500,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 5 / 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to sprint details page
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildStatusWidget(mDate[index]['status']),
                                SizedBox(height: 8),
                                Text(
                                  '${mDate[index]['title']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '${mDate[index]['Datetime']}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Navigate to sprint details page
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 24),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  child: mDate[index]['status'] == 'completed'
                                      ? InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Session(id:index),
                                                ));
                                          },
                                          child: Text(
                                            _getButtonText(
                                                mDate[index]['status']),
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          _getButtonText(
                                              mDate[index]['status']),
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusWidget(String status) {
    IconData? icon;
    Color? color;
    String? text;
    switch (status) {
      case 'completed':
        icon = Icons.check_circle;
        color = Colors.green;
        text = 'Completed';
        break;
      case 'in-progress':
        icon = Icons.hourglass_bottom;
        color = Colors.orange;
        text = 'In Progress';
        break;
      case 'locked':
        icon = Icons.lock;
        color = Colors.red;
        text = 'Locked';
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          text!,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _getButtonText(String status) {
    switch (status) {
      case 'completed':
        return 'View Details';
      case 'in-progress':
        return 'Go to sprint Board';
      case 'locked':
        return 'Unlock Now';
      default:
        return '';
    }
  }
}
