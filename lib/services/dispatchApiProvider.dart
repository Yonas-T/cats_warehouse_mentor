import 'dart:convert';

import 'package:cats_warehouse_mentor/models/dispatch.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/baseUrl.dart';

class DispatchApiProvider {
  Future<Dispatch> dispatch(Dispatch dispatch) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> postJson = {
      "id": dispatch.id,
      "referenceNo": dispatch.referenceNo,
      "allocationItemId": dispatch.allocationItemId,
      "transporterId": dispatch.transporterId,
      "transporterName": dispatch.transporterName,
      "plateNo": dispatch.plateNo,
      "driverName": dispatch.driverName,
      "driverPhone": dispatch.driverPhone,
      "quantity": dispatch.quantity,
      "remark": dispatch.remark,
      "preparedById": dispatch.preparedById,
      "preparedByEmail": dispatch.preparedByEmail,
      "dispatchStatus": dispatch.dispatchStatus,
      "destination": dispatch.destination
    };
    var token = prefs.getString('user');

    final response = await http.post(
      Uri.parse('$baseUrl/api/cats_core/dispatches/1/confirm'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: json.encode(postJson),
    );

    print('BODY: ${response.body}');
    print('DECODED: ${json.decode(response.body)['token'].runtimeType}');
    print(response.statusCode);

    if (response.statusCode == 200) {
      return Dispatch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<Notifications> getNotification() async {
    //TODO fetch from local db
    Notifications? ss;
    return ss!;
  }
}
