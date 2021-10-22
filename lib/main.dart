import 'package:cats_warehouse_mentor/blocs/authBloc/authbloc_bloc.dart';
import 'package:cats_warehouse_mentor/constants/colors.dart';
import 'package:cats_warehouse_mentor/repositories/authRepositories.dart';
import 'package:cats_warehouse_mentor/repositories/dispatchRepository.dart';
import 'package:cats_warehouse_mentor/repositories/notificationRepository.dart';
import 'package:cats_warehouse_mentor/screens/dispatchConfirmationScreen/dispatchConfirmationScreen.dart';
import 'package:cats_warehouse_mentor/screens/dispatchListingScreen/dispatchListingScreen.dart';
import 'package:cats_warehouse_mentor/screens/homeScreen.dart';
import 'package:cats_warehouse_mentor/screens/loginScreen/loginScreen.dart';
import 'package:cats_warehouse_mentor/screens/tallyScreen/tallyScreen.dart';
import 'package:cats_warehouse_mentor/services/notificationServices/notificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:rxdart/subjects.dart';


final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

String? selectedNotificationPayload;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      !kIsWeb && Platform.isLinux
          ? null
          : await NotificationServices()
              .flutterLocalNotificationsPlugin
              .getNotificationAppLaunchDetails();

  //! needs to be changed with whatever is the landing screen
  // String initialRoute = HomeScreen.routeName;
  // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //   selectedNotificationPayload = notificationAppLaunchDetails!.payload;
  //   //! needs to be changed with whatever screen is in the navigation function
  //   // initialRoute = ThirdPage.routeName;
  // }
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  // ignore: prefer_const_constructors
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await NotificationServices().flutterLocalNotificationsPlugin.initialize(
      initializationSettings, onSelectNotification: (String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    selectedNotificationPayload = payload;
    selectNotificationSubject.add(payload);
  });
  runApp(CatsApp(

  ));
}

class CatsApp extends StatefulWidget {
  final AuthRepository authRepository = AuthRepository();

  @override
  _CatsAppState createState() => _CatsAppState();
}

class _CatsAppState extends State<CatsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: kNavy,
      ),
      home: BlocProvider(
          create: (context) =>
              AuthblocBloc(authRepository: widget.authRepository)
                ..add(AppStartedEvent()),
          child: MyApp(authRepository: widget.authRepository)),
    );
  }
}

class MyApp extends StatefulWidget {
  AuthRepository authRepository;
  DispatchRepository dispatchRepository = DispatchRepository();
  NotificationRepository notificationRepository = NotificationRepository();

  MyApp({required this.authRepository});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthblocBloc, AuthblocState>(
      builder: (context, state) {
        if (state is AuthblocInitial) {
          print('init');
          return Container();
        }
        if (state is UnauthenticatedState) {
          print('unauthentic');
          return LoginScreen(authRepository: widget.authRepository);
        }
        if (state is AuthenticatedState) {
          print('authentic');
          return 
          // HomeScreenParent(
          // );
          DispatchListingScreen(
            dispatchRepository: widget.dispatchRepository,
          );
        }
        return Container();
      },
    );
  }
}
