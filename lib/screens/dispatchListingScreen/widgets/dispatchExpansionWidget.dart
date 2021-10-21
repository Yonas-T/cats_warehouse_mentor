import 'package:cats_warehouse_mentor/blocs/dispatchBloc/dispatch_bloc.dart';
import 'package:cats_warehouse_mentor/constants/colors.dart';
import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:cats_warehouse_mentor/constants/days.dart';
import 'package:cats_warehouse_mentor/models/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DispatchExpansionWidget extends StatefulWidget {
  Notifications dispatchNotification;
  DispatchState state;

  DispatchExpansionWidget(
      {required this.dispatchNotification, required this.state});

  @override
  _DispatchExpansionWidgetState createState() =>
      _DispatchExpansionWidgetState();
}

class _DispatchExpansionWidgetState extends State<DispatchExpansionWidget> {
  late DispatchBloc dispatchBloc;

  @override
  Widget build(BuildContext context) {
    // dispatchBloc = BlocProvider.of<DispatchBloc>(context);

    DateTime date = DateTime.parse(widget.dispatchNotification.data.date);
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
                child: Text(
                  '${days[date.month]}, ${date.day} ${date.year}',
                  style: TextStyle(fontSize: kNormalFont, color: kNavy),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  '${widget.dispatchNotification.data.title}',
                  style: TextStyle(fontSize: kNormalFont, color: kNavy),
                ),
              ),
              Text(
                '${widget.dispatchNotification.data.body.allocatedQuantity}',
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
                    titleValue: widget.dispatchNotification.data.body.commodity,
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Dispatch Ref: ',
                    titleValue:
                        widget.dispatchNotification.data.body.dispatchRef,
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Batch No: ',
                    titleValue: widget.dispatchNotification.data.body.batchNo,
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Allocated Quantity: ',
                    titleValue: widget
                        .dispatchNotification.data.body.allocatedQuantity
                        .toString(),
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Quantity: ',
                    titleValue: widget.dispatchNotification.data.body.quantity
                        .toString(),
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Driver\'s name: ',
                    titleValue:
                        widget.dispatchNotification.data.body.driverName,
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Driver\'s phone No: ',
                    titleValue:
                        widget.dispatchNotification.data.body.driverPhone,
                  ),
                  SizedBox(height: 4),
                  NotificationBodyWidget(
                    titleKey: 'Truck plate No: ',
                    titleValue:
                        widget.dispatchNotification.data.body.truckPlateNo,
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
                          // dispatchBloc.add(
                          //   StartCount(),
                          // );
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
    ;
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
