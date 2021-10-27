import 'package:cats_warehouse_mentor/blocs/dispatchBloc/dispatch_bloc.dart';
import 'package:cats_warehouse_mentor/constants/colors.dart';
import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:cats_warehouse_mentor/constants/days.dart';
import 'package:cats_warehouse_mentor/models/dispatch.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:cats_warehouse_mentor/repositories/dispatchRepository.dart';
import 'package:cats_warehouse_mentor/screens/tallyScreen/tallyScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DispatchExpansionWidget extends StatefulWidget {
  DispatchData dispatchNotification;
  DispatchState state;

  DispatchExpansionWidget(
      {required this.dispatchNotification, required this.state});

  @override
  _DispatchExpansionWidgetState createState() =>
      _DispatchExpansionWidgetState();
}

class _DispatchExpansionWidgetState extends State<DispatchExpansionWidget> {
  DispatchBloc? dispatchBloc;
  DispatchRepository dispatchRepository = DispatchRepository();

  @override
  void initState() {
    dispatchBloc = DispatchBloc(dispatchRepository: dispatchRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // dispatchBloc = BlocProvider.of<DispatchBloc>(context);

    // DateTime date = DateTime.parse(widget.dispatchNotification.date);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: Colors.grey[100],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90,
                height: 40,
                alignment: Alignment.center,
                color: Colors.grey[350],
                // child: Text(
                //   '${days[date.month]}, ${date.day} ${date.year}',
                //   style: TextStyle(fontSize: kNormalFont, color: kNavy),
                // ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  '${widget.dispatchNotification.dispatchStatus}',
                  style: TextStyle(fontSize: kNormalFont, color: kNavy),
                ),
              ),
              Text(
                '${widget.dispatchNotification.quantity}',
                style: TextStyle(fontSize: kNormalFont, color: kNavy),
              ),
            ],
          ),
          collapsedIconColor: kNavy,
          iconColor: kNavy,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NotificationBodyWidget(
                    titleKey: 'Commodity: ',
                    titleValue: 'Commodity',
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Dispatch Ref: ',
                    titleValue: widget.dispatchNotification.referenceNo,
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Quantity: ',
                    titleValue: widget.dispatchNotification.quantity.toString(),
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Driver\'s name: ',
                    titleValue: widget.dispatchNotification.driverName,
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Driver\'s phone No: ',
                    titleValue: widget.dispatchNotification.driverPhone,
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Truck plate No: ',
                    titleValue: widget.dispatchNotification.plateNo,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kNavy,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                        child: Text("Start Tally",
                            style: TextStyle(
                                fontSize: kButtonFont, color: Colors.white)),
                        onPressed: () {
                          dispatchBloc!.add(
                            StartCount(
                                notificationDataToCount:
                                    widget.dispatchNotification),
                          );
                          Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TallyParentScreen(
                            notificationForCount: widget.dispatchNotification,
                          );
                        }));
                          print('tapped');

                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationBodyWidget extends StatelessWidget {
  String titleKey;
  String titleValue;

  NotificationBodyWidget({required this.titleKey, required this.titleValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            titleKey,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: kNormalFont, color: kNavy),
          ),
        ),
        SizedBox(width: 8),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            titleValue,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: kNormalFont, color: kNavy),
          ),
        ),
      ],
    );
  }
}
