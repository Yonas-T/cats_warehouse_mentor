import 'dart:io';

import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:cats_warehouse_mentor/screens/loginScreen/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'dart:async';

class NotificationServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await NotificationServices().flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics,
        payload: 'item x');
  }

}

class NotificationService {
  
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static const InitializationSettings initializationSettings =
      InitializationSettings(
    android: initializationSettingsAndroid);
  
  // final BehaviorSubject<ReceivedNotification>
  //     didReceiveLocalNotificationSubject =
  //     BehaviorSubject<ReceivedNotification>();

  // final BehaviorSubject<String?> selectNotificationSubject =
  //     BehaviorSubject<String?>();

  static const MethodChannel platform =
      MethodChannel('dexterx.dev/flutter_local_notifications_example');
  String? selectedNotificationPayload;

  static const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  // final IOSInitializationSettings initializationSettingsIOS =
  //     IOSInitializationSettings(
  //         requestAlertPermission: false,
  //         requestBadgePermission: false,
  //         requestSoundPermission: false,
  //         onDidReceiveLocalNotification: (
  //           int id,
  //           String? title,
  //           String? body,
  //           String? payload,
  //         ) async {
  //           NotificationService().didReceiveLocalNotificationSubject.add(
  //                 ReceivedNotification(
  //                   id: id,
  //                   title: title,
  //                   body: body,
  //                   payload: payload,
  //                 ),
  //               );
  //         });

  
  void requestPermissions() {
    NotificationService()
        .flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    NotificationService()
        .flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotification(
      {required int id, required String title, required String body}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await NotificationService().flutterLocalNotificationsPlugin.show(
        id, title, body, platformChannelSpecifics,
        payload: 'item x');
  }

  // void configureDidReceiveLocalNotificationSubject(BuildContext context) {
  //   NotificationService()
  //       .didReceiveLocalNotificationSubject
  //       .stream
  //       .listen((ReceivedNotification receivedNotification) async {
  //     await showDialog(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: receivedNotification.title != null
  //             ? Text(receivedNotification.title!)
  //             : null,
  //         content: receivedNotification.body != null
  //             ? Text(receivedNotification.body!)
  //             : null,
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             isDefaultAction: true,
  //             onPressed: () async {
  //               Navigator.of(context, rootNavigator: true).pop();
  //               await Navigator.push(
  //                 context,
  //                 MaterialPageRoute<void>(
  //                   builder: (BuildContext context) {
  //                     // return SecondPage(receivedNotification.payload);
  //                     return LoginScreen();
  //                   },
  //                 ),
  //               );
  //             },
  //             child: const Text('Ok'),
  //           )
  //         ],
  //       ),
  //     );
  //   });
  // }

  // void _configureSelectNotificationSubject(BuildContext context) {
  //   NotificationService()
  //       .selectNotificationSubject
  //       .stream
  //       .listen((String? payload) async {
  //     await Navigator.pushNamed(context, LOGIN_SCREEN);
  //   });
  // }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

class PaddedElevatedButton extends StatelessWidget {
  const PaddedElevatedButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
        ),
      );
}
