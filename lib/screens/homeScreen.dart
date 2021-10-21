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
      create: (context) =>
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
    notificationsBloc = NotificationsBloc(
        notificationRepository: widget.notificationRepository);
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
          BlocListener<NotificationsBloc, NotificationsState>(
            listener: (context, state) {
              
            },
            child: BlocBuilder<NotificationsBloc, NotificationsState>(
              builder: (context, state) {
                print('Appbar state: ');
                if (state is NotificationsLoading) {
                  return Text('loading');
                }
                if (state is NotificationsFailed) {
                  return Text('failed');
                }
                if (state is NotificationsSuccess) {
                  return IconButton(
                      onPressed: () {
                        final notifications = state.notifications;
                        print('in builder: ');
                        notifications.data.forEach((notification) {
                          NotificationService().showNotification(
                              id: 0,
                              title: notification.title,
                              body: notification.body.bodyTitle);
                        });
                      },
                      icon: Icon(Icons.add));
                }
                return Container();
              },
            ),
          )
        ],
      ),
      body: Container(),
      // body: BlocBuilder<NotificationsBloc, NotificationsState>(
      //   builder: (context, state) {
      //     print(state);
      //     if (state is NotificationsInitial) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (state is NotificationsLoading) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (state is NotificationsSuccess) {
      //       return Container(
      //         child: Text('got notification'),
      //       );
      //     }
      //     return Container();
      //   },
      // ),
    );
  }
}
