import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:cats_warehouse_mentor/cubit/notifications_cubit.dart';
import 'package:cats_warehouse_mentor/services/notificationServices/notificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../utils/localNotification.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotificationsCubit>(context).fetchNotifications();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () async {
                    if (state is NotificationsLoaded) {
                      final notifications =
                          // ignore: unnecessary_cast
                          (state as NotificationsLoaded).storeNotifications;
                      notifications.forEach((notification) {
                        NotificationService().showNotification(
                            id: 0,
                            title: notification.title,
                            body: notification.body);
                      });
                    }
                  },
                  icon: Icon(Icons.add));
            },
          )
        ],
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final notifications =
                (state as NotificationsLoaded).storeNotifications;
            notifications.forEach((notification) {
              print(notification.body);
            });
            return Container();
          }
        },
      ),
    );
  }
}
