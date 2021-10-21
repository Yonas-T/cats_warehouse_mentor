import 'package:cats_warehouse_mentor/blocs/notifications/notifications_bloc.dart';
import 'package:cats_warehouse_mentor/constants/constants.dart';
// import 'package:cats_warehouse_mentor/cubit/notifications_cubit.dart';
import 'package:cats_warehouse_mentor/repositories/notificationRepository.dart';
import 'package:cats_warehouse_mentor/services/notificationServices/notificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../utils/localNotification.dart';
class HomeScreenParent extends StatefulWidget {
  const HomeScreenParent({Key? key}) : super(key: key);

  @override
  _HomeScreenParentState createState() => _HomeScreenParentState();
}

class _HomeScreenParentState extends State<HomeScreenParent> {
  NotificationRepository notificationRepository = NotificationRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NotificationsBloc(notificationRepository: notificationRepository),
      child: HomeScreen(notificationRepository: notificationRepository),
    );
  }
}

class HomeScreen extends StatefulWidget {
  NotificationRepository notificationRepository;

  HomeScreen({required this.notificationRepository});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationsBloc? notificationsBloc;

  @override
  void initState() {
    notificationsBloc =
        NotificationsBloc(notificationRepository: widget.notificationRepository);
    notificationsBloc!.add(LoadNotification());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<NotificationsBloc>(context).fetchNotifications();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () async {
                    if (state is NotificationsSuccess) {
                      final notifications = state.notifications;
                      notifications.data.forEach((notification) {
                        NotificationService().showNotification(
                            id: 0,
                            title: notification.title,
                            body: notification.body.bodyTitle);
                      });
                    }
                  },
                  icon: Icon(Icons.add));
            },
          )
        ],
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // final notifications = state.;
            // notifications.data.forEach((notification) {
            //   print(notification.body);
            // });
            return Container();
          }
        },
      ),
    );
  }
}
