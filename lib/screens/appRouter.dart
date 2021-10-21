import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:cats_warehouse_mentor/cubit/notifications_cubit.dart';
import 'package:cats_warehouse_mentor/repositories/notificationRepository.dart';
import 'package:cats_warehouse_mentor/screens/loginScreen/loginScreen.dart';
import 'package:cats_warehouse_mentor/services/notificationServices/notificationApiProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './homeScreen.dart';

class AppRouter{
  late NotificationRepository notificationRepository;

  AppRouter(){
    notificationRepository = NotificationRepository(notificationApiProvider: NotificationApiProviderService());
  }

  Route? generateAppRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => NotificationsCubit(notificationRepository: notificationRepository),
          child: HomeScreen(),
        ));
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_)=> LoginScreen(authRepository: null,));
      
      default:
        return null;
    }
    
  }
}