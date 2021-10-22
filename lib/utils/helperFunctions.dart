import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import '../services/database/helpers/service.dart';
import '../services/dispatchApiProvider.dart';
import 'package:cats_warehouse_mentor/models/dispatch.dart';

DispatchApiProvider dispatchApiProvider = DispatchApiProvider();

String? validatePassword(String? value) {
  if ((value?.length ?? 0) < 6)
    return 'Password must be more than 6 characters';
  else
    return null;
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value ?? ''))
    return 'Enter Valid Email';
  else
    return null;
}

Future<void> initConnectivity() async {
  DispatchService dispatchService = DispatchService();

  ConnectivityResult result = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();

  try {
    result = await _connectivity.checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      print("connected");
      List fromLocalDb = await dispatchService.readdispatch();
      print(fromLocalDb);

      fromLocalDb.forEach((element) {
        if (element['status'] == 'false') {
          element.remove('status');
          dispatchApiProvider.dispatch(Dispatch.fromJson(element));
        }
      });
    } else {}
  } on PlatformException catch (e) {
    throw Exception(e);
  }
}
