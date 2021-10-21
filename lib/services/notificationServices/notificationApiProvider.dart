import 'dart:convert';

import 'package:cats_warehouse_mentor/constants/baseUrl.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotificationApiProviderService {
  // final baseUrl = "http://10.0.2.2:3000";

  Future<Notifications> fetchNotificationsApiProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // try {
    var token = prefs.getString('user');

    final response = await http.get(
      Uri.parse(baseUrl + "api/cats_core/notifications/unread"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.body);

    String responsedata = "this is a response \n another response";
    print(responsedata);

    if (response.statusCode == 200) {
      return Notifications.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Notify');
    }
    // } catch (e) {
    //   throw Exception('Failed to Notify');
    // }
  }
}
