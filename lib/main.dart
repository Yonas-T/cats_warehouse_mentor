import 'dart:async';
import 'dart:io';

import 'package:cats_warehouse_mentor/screens/homeScreen.dart';
import 'package:cats_warehouse_mentor/services/notificationServices/notificationApiProvider.dart';
import 'package:cats_warehouse_mentor/repositories/notificationRepository.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/notifications_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String initialRoute = "/";
  runApp(
    MaterialApp(
      initialRoute: initialRoute,
      routes: <String, WidgetBuilder>{
        "/": (_) {
          return BlocProvider(
            create: (context) => NotificationsCubit(
                notificationRepository: NotificationRepository(
                    notificationApiProvider: NotificationApiProviderService())),
            child: HomeScreen(),
          );
        },
      },
    ),
  );
}