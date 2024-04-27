import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> registration(Map<String, dynamic> data) async {
  final uri = Uri.parse('http://127.0.0.1:8000/reg');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode(data);

  try {
    final response = await http.post(uri, headers: headers, body: body);

    if (response.statusCode == 201) {
      // Registration successful
      final responseData = json.decode(response.body);
      print(responseData);
    } else {
      // Registration failed, handle the error
      print('Failed to register: ${response.statusCode}');
      throw Exception('Failed to register');
    }
  } catch (e) {
    // Handle network or server errors
    print('Network or server error: $e');
    throw Exception('Network or server error');
  }
}


// Future login(Map<String, dynamic> data) async{
//   final uri = Uri.parse('http://127.0.0.1:8000/login');
//   final headers = {'Content-Type': 'application/json'};
//   final body = json.encode(data);
//
//   try {
//     final response = await http.post(uri, headers: headers, body: body);
//
//     if (response.statusCode == 200) {
//       // Registration successful
//       final responseData = json.decode(response.body);
//       print(responseData);
//       final prefs = await SharedPreferences.getInstance();
//       final userDataJson = json.encode(responseData);
//       await prefs.setString('userData', userDataJson);
//
//     } else {
//       // Registration failed, handle the error
//       print('Failed to register: ${response.statusCode}');
//       throw Exception('Failed to register');
//     }
//   } catch (e) {
//     // Handle network or server errors
//     print('Network or server error: $e');
//     throw Exception('Network or server error');
//   }

// }


Future<void> getCurrentUser({required String email, required String password}) async {
  final baseUrl = 'http://127.0.0.1:8000';
  final path = '/reg';

  // Construct the URI with query parameters
  final uri = Uri.parse('$baseUrl$path?email=$email&password=$password');

  try {
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Request was successful, parse the response data
      final prefs = await SharedPreferences.getInstance();

      final data = json.decode(response.body);
      final userDataJson = json.encode(data);
      await prefs.setString('userData', userDataJson);
      // Handle the response data as needed
    } else {
      // Request failed, handle the error
      print('Failed to get current user: ${response.statusCode}');
      throw Exception('Failed to login');
    }
  } catch (e) {
    // Handle any errors that occur during the HTTP request
    print('Error while getting current user: $e');
    throw Exception('Network or server error');
  }
}





Future<void> update({required Map<String, dynamic> userData, required int id}) async {
  final baseUrl = 'http://127.0.0.1:8000';
  final path = '/reg/$id'; // Assuming the endpoint is /reg/{id}

  // Construct the URI
  final uri = Uri.parse('$baseUrl$path');

  try {
    final response = await http.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(userData),
    );

    if (response.statusCode == 202) {
      // Request was successful, parse the response data
      final data = json.decode(response.body);
      print(data);
      // Handle the response data as needed
    } else {
      // Request failed, handle the error
      print('Failed to update user: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any errors that occur during the HTTP request
    print('Error while updating user: $e');
  }
}



