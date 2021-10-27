import 'dart:convert';

import 'package:cats_warehouse_mentor/models/dispatch.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/models/receipt.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/baseUrl.dart';
import './database/helpers/service.dart';

class DispatchApiProvider {
  DispatchService dispatchService = DispatchService();

  Future<Dispatch> fetchDispatch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('user');

    final response = await http.get(
      Uri.parse('$baseUrl/api/cats_core/dispatches/search?status[]=Started'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    print('BODY: ${response.body}');
    print(response.statusCode);

    if (response.statusCode == 200) {
      // postJson['status'] = 'true';

      try {
      
        var s = await dispatchService.readdispatch();
        print('DB: $s');
        Dispatch.fromJson(jsonDecode(response.body))
            .dispatchData
            .forEach((element) {
          dispatchService.savedispatch(element);
          print('======================= $element');
        });
      } catch (e) {
        print(e);
      }
      return Dispatch.fromJson(json.decode(response.body));
    } else {
      // postJson['status'] = 'false';
      throw Exception('Failed to load');
    }
  }

  Future<Reciept> dispatch(Reciept reciept) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> postJson = {
      "payload": {
        "commodity_status": reciept.recieptData.commodityStatus,
        "dispatch_id": reciept.recieptData.dispatchId,
        "quantity": reciept.recieptData.quantity,
        "remark": reciept.recieptData.remark,
        "prepared_by_id": reciept.recieptData.preparedById,
      },
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
    print(response.statusCode);

    if (response.statusCode == 200) {
      postJson['status'] = 'true';

      try {
        // dispatchService.savedispatch(Reciept.fromJson(postJson));
      } catch (e) {
        print(e);
      }
      return Reciept.fromJson(json.decode(response.body));
    } else {
      postJson['status'] = 'false';
      throw Exception('Failed to load');
    }
  }

  Future<Notifications> getNotification() async {
    //TODO fetch from local db
    Notifications? ss;
    return ss!;
  }
}
