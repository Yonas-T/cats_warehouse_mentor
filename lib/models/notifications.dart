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
    var notificationBody =
        NotificationBody.fromJson(parsedJson['body']);
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
    mapping['read'] = read;
    mapping['created_at'] = createdAt;
    mapping['title'] = title;
    mapping['body'] = body;
    mapping['date'] = date;

    return mapping;
  }
}

class NotificationBody {
  String bodyTitle;
  String dispatchRef;
  String batchNo;
  String commodity;
  double allocatedQuantity;
  double quantity;
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
        dispatchRef: parsedJson['dispatch_ref'],
        batchNo: parsedJson['batch_no'],
        commodity: parsedJson['commodity'],
        allocatedQuantity: parsedJson['allocated_quantity'],
        quantity: parsedJson['quantity'],
        truckPlateNo: parsedJson['truck_plate_no'],
        driverName: parsedJson['driver_name'],
        driverPhone: parsedJson['driver_phone']);
  }
}
