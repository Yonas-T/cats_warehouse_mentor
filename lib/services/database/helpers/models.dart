class NotificationData {
  int? id;
  String? read;
  String? createdAt;
  String? title;
  String? body;
  String? date;

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

class DispatchData {
  int? id;
  String? referenceNo;
  String? allocationItemId;
  String? transporterId;
  String? transporterName;
  String? plateNo;
  String? driverName;
  String? driverPhone;
  int? quantity;
  String? remark;
  String? preparedById;
  String? preparedByEmail;
  String? dispatchStatus;
  String? destination;
  
  dispatchMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['reference_no'] = referenceNo;
    mapping['allocation_item_id'] = allocationItemId;
    mapping['transporter_id'] = transporterId;
    mapping['transporter_name'] = transporterName;
    mapping['plate_no'] = plateNo;
    mapping['driver_name'] = driverName;
    mapping['driver_phone'] = driverPhone;
    mapping['quantity'] = quantity;
    mapping['remark'] = remark;
    mapping['prepared_by_id'] = preparedById;
    mapping['prepared_by_email'] = preparedByEmail;
    mapping['dispatch_status'] = dispatchStatus;
    mapping['destination'] = destination;
    return mapping;
  }
}

class ReceiptData {
  String? commodityStatus;
  String? dispatchId;
  int? quantity;
  String? remark;
  String? preparedById;
  
  receiptMap() {
    var mapping = Map<String, dynamic>();
    mapping['commodity_status'] = commodityStatus;
    mapping['dispatch_id'] = dispatchId;
    mapping['quantity'] = quantity;
    mapping['remark'] = remark;
    mapping['prepared_by_id'] = preparedById;

    return mapping;
  }
}