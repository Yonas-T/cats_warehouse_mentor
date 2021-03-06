import 'dart:convert';

import 'package:cats_warehouse_mentor/models/userCred.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/baseUrl.dart';
import './database/helpers/service.dart';

UserService userService = UserService();

class AuthApiProvider {
  Future<UserCred> login(email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> postJson = {
      "auth": {"email": email, "password": password},
      "tokenize": false
    };
    final response = await http.post(
      Uri.parse('$baseUrl/api/cats_core/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(postJson),
    );

    print('BODY: ${response.body}');
    print('DECODED: ${json.decode(response.body)['token'].runtimeType}');

    print(response.statusCode);

    if (response.statusCode == 200) {
      Map<String, dynamic> decoded = jsonDecode(response.body);
      var user = json.decode(response.body)['user'];
      user['roles'] = user['roles'].toString();
      print(user);
      userService.saveuser(user);
      prefs.setString('user', json.decode(response.body)['token']);
      print(json.decode(response.body));
      return UserCred.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
