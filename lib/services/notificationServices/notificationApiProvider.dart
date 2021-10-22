import 'dart:convert';

import 'package:cats_warehouse_mentor/constants/baseUrl.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/database/helpers/service.dart';

class NotificationApiProviderService {

  Future<Notifications> fetchNotificationsApiProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    NotificationDataService notificationService = NotificationDataService();

    var token = prefs.getString('user');
    final response = await http.get(
      Uri.parse(
          "https://qa.warehouse.ndrmcapps.org/api/cats_core/notifications/unread"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    ).then((response) {
      print(response.body);
      // dynamic allresponsedata = {
      //   "success": true,
      //   "data": [
      //     {
      //       "id": 1,
      //       "read": false,
      //       "created_at": 'datefiled',
      //       "title": 'Dispatch Notification',
      //       "date": "20221-10-21",
      //       "body":
      //           "Commodity with the following details has been dispatched to you: \n Dispatch Ref. = 0001\n Batch No. = 0001\n Commodity = Cerial \n Allocated Quantity = 1000.0\n Quantity = 1000.0\n Truck Plate No. = Supplier Plate No.\n Driver Name = Supplier driver\n Driver Phone = Supplier driver phone\n"
      //     }
      //   ]
      // };
      dynamic allresponsedata = jsonDecode(response.body);

      allresponsedata['data'].forEach((element) {
        String responsedata = element['body'];
        var newdata = responsedata.split('\n');
        Map<String, String> objects = {};
        newdata.forEach((String element) {
          if (element.contains('=')) {
            objects[element.split('=')[0].replaceAll(' ', '')] =
                element.split('=')[1];
          } else if (objects.isEmpty) {
            objects['body_title'] = element;
          } else {}
        });
        element['body'] = objects;
      });

      if (response.statusCode == 200) {
        Notifications notificationobj = Notifications.fromJson(allresponsedata);
        notificationobj.data.forEach((element) {
          notificationService.savenotification(element);
        });
        return notificationobj;
      } else {
        throw Exception('Failed to Notify');
      }
    }).catchError((onError) {
      print(onError);
    });

    return response;

  }
}
