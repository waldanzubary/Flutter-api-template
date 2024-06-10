import 'dart:convert';

import 'package:http/http.dart' as http;
import 'post_model.dart'; // Import model Post

class HttpService {
  //change with ur api url 

  // get api url
  final String postsURL = "http://127.0.0.1:8000/api/listbuku";

  // post api url login section
  final String loginURL = "http://127.0.0.1:8000/api/login";


//future final String postsURL = "UR URL API";
  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(postsURL));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
        return posts;
      } else {
        throw "Unable to retrieve posts. Status code: ${response.statusCode}";
      }
    } catch (e) {
      throw "Error occurred while fetching posts: $e";
    }
  }
  
  

  //future final String loginURL = "UR URL API account login";
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(loginURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      print('Login API Response Body: ${response.body}'); // Debugging statement

      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          throw "Empty response received from server";
        }
        return jsonDecode(response.body);
      } else {
        throw "Unable to login. Status code: ${response.statusCode}";
      }
    } catch (e) {
      throw "Error occurred while logging in: $e";
    }
  }
}
