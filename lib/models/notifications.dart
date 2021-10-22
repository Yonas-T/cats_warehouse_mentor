import 'dart:convert';

class Notifications {
  bool success;
  List<NotificationData> data;

  Notifications({required this.data, required this.success});

  factory Notifications.fromJson(Map<String, dynamic> parsedJson) {
    final data = parsedJson['data'] as List;
    List<NotificationData> dataList =
        data.map((i) => NotificationData.fromJson(i)).toList();
    return Notifications(data: dataList, success: parsedJson['success']);
  }
}

class NotificationData {
  int id;
  bool read;
  String createdAt;
  String title;
  String date;
  NotificationBody body;

  NotificationData(
      {required this.id,
      required this.read,
      required this.createdAt,
      required this.title,
      required this.date,
      required this.body});

  factory NotificationData.fromJson(Map<String, dynamic> parsedJson) {
    var notificationBody = NotificationBody.fromJson(parsedJson['body']);
    return NotificationData(
        id: parsedJson['id'],
        read: parsedJson['read'],
        createdAt: parsedJson['created_at'],
        title: parsedJson['title'],
        date: parsedJson['date'],
        body: notificationBody);
  }
  notificationMap() {

    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['read'] = read.toString();
    mapping['created_at'] = createdAt;
    mapping['title'] = title;
    mapping['body'] =jsonEncode(body.notificationBodyMap());
    mapping['date'] = date;

    return mapping;
  }
}

class NotificationBody {
  String bodyTitle;
  String dispatchRef;
  String batchNo;
  String commodity;
  String allocatedQuantity;
  String quantity;
  String truckPlateNo;
  String driverName;
  String driverPhone;

  NotificationBody(
      {required this.bodyTitle,
      required this.dispatchRef,
      required this.batchNo,
      required this.commodity,
      required this.allocatedQuantity,
      required this.quantity,
      required this.truckPlateNo,
      required this.driverName,
      required this.driverPhone});

  factory NotificationBody.fromJson(Map<String, dynamic> parsedJson) {
    return NotificationBody(
        bodyTitle: parsedJson['body_title'],
        dispatchRef: parsedJson['DispatchRef.'],
        batchNo: parsedJson['BatchNo.'],
        commodity: parsedJson['Commodity'],
        allocatedQuantity: parsedJson['AllocatedQuantity'],
        quantity: parsedJson['Quantity'],
        truckPlateNo: parsedJson['TruckPlateNo.'],
        driverName: parsedJson['DriverName'],
        driverPhone: parsedJson['DriverPhone']);
  }
  notificationBodyMap() {
    var mapping = Map<String, dynamic>();
    mapping['body_title'] = bodyTitle;
    mapping['DispatchRef.'] = dispatchRef;
    mapping['BatchNo.'] = batchNo;
    mapping['Commodity'] = commodity;
    mapping['AllocatedQuantity'] = allocatedQuantity;
    mapping['Quantity'] = quantity;
    mapping['TruckPlateNo.'] = truckPlateNo;
    mapping['DriverName'] = driverName;
    mapping['DriverPhone'] = driverPhone;

    return mapping;
  }
}
