import 'dart:developer';

import 'package:cats_warehouse_mentor/blocs/dispatchBloc/dispatch_bloc.dart';
import 'package:cats_warehouse_mentor/constants/colors.dart';
import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:cats_warehouse_mentor/main.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/repositories/dispatchRepository.dart';
import 'package:cats_warehouse_mentor/screens/dispatchListingScreen/widgets/dispatchExpansionWidget.dart';
import 'package:cats_warehouse_mentor/screens/tallyScreen/tallyScreen.dart';
import 'package:cats_warehouse_mentor/services/notificationServices/notificationService.dart';
import 'package:cats_warehouse_mentor/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DispatchListingScreen extends StatefulWidget {
  DispatchRepository dispatchRepository;

  DispatchListingScreen({required this.dispatchRepository});
  @override
  _DispatchListingScreenState createState() => _DispatchListingScreenState();
}

class _DispatchListingScreenState extends State<DispatchListingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DispatchBloc(dispatchRepository: widget.dispatchRepository)
            ..add(DispatchFetchEvent()),
      child: DispatchListingChildScreen(
          dispatchRepository: widget.dispatchRepository),
    );
  }
}

class DispatchListingChildScreen extends StatefulWidget {
  DispatchRepository dispatchRepository;
  final NotificationAppLaunchDetails? notificationAppLaunchDetails;

  DispatchListingChildScreen(
      {required this.dispatchRepository, this.notificationAppLaunchDetails});
  static const String routeName = '/';

  bool get didNotificationLaunchApp =>
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  @override
  _DispatchListingChildScreenState createState() =>
      _DispatchListingChildScreenState();
}

class _DispatchListingChildScreenState
    extends State<DispatchListingChildScreen> {
  List<Notifications> dispatchToPass = [];
  List<NotificationData> notifData = [];
  NotificationBody? notifBody;

  late DispatchBloc dispatchBloc;

  callNotification() async {
    await NotificationServices()
        .showNotification(notifData[0].title, notifBody!.bodyTitle);
  }

  @override
  void initState() {
    initConnectivity();
    // DispatchBloc dispatchBloc =
    //     DispatchBloc(dispatchRepository: widget.dispatchRepository);
    // dispatchBloc.add(DispatchFetchEvent());

    notifBody = NotificationBody(
        bodyTitle: 'Commodity with the following details...',
        dispatchRef: '0001',
        batchNo: '00001',
        commodity: 'Cereal',
        allocatedQuantity: '1000.0',
        quantity: '1000.0',
        truckPlateNo: 'Supplier Plate No',
        driverName: 'Supplier Driver',
        driverPhone: 'Supplier Driver Phone');
    notifData.add(NotificationData(
        id: 5,
        read: false,
        createdAt: '2021-10-15T12:39:02.066Z',
        title: 'Dispatch Notification',
        date: '2021-10-18',
        body: notifBody!));
    dispatchToPass.add(Notifications(data: notifData, success: true));
    callNotification();

    super.initState();
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String? payload) async {
      await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return DispatchListingScreen(
          dispatchRepository: widget.dispatchRepository,
        );
      }));
    });
  }

  @override
  void dispose() {
    // didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dispatches',
          style: TextStyle(color: kWhite, fontSize: kTitleBoldFont),
        ),
        backgroundColor: kNavy,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16),
              Text('Dispatches',
                  style: TextStyle(color: kNavy, fontSize: kTitleBoldFont)),
            ],
          ),
          BlocListener<DispatchBloc, DispatchState>(
            listener: (context, state) {
              
            },
            child: BlocBuilder<DispatchBloc, DispatchState>(
              builder: (context, state) {
                print(state);
                if (state is DispatchInitialState) {
                  return Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kNavy),
                  ));
                }
                if (state is DispatchLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(kNavy),
                    ),
                  );
                }
                if (state is DispatchFailedState) {
                  return Text('failed ${state.message}');
                }
                if (state is DispatchLoadedState) {
                  log('message');
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.dispatchLoaded.dispatchData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return DispatchExpansionWidget(
                            state: state,
                            dispatchNotification:
                                state.dispatchLoaded.dispatchData[index],
                          );
                        }),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
