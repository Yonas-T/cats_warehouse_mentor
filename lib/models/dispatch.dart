class Dispatch {
  int id;
  String referenceNo;
  int allocationItemId;
  int transporterId;
  String transporterName;
  String plateNo;
  String driverName;
  String driverPhone;
  String quantity;
  String remark;
  int preparedById;
  String preparedByEmail;
  String dispatchStatus;
  String destination;
  String? status;

  Dispatch(
      {required this.id,
      required this.referenceNo,
      required this.allocationItemId,
      required this.transporterId,
      required this.transporterName,
      required this.plateNo,
      required this.driverName,
      required this.driverPhone,
      required this.quantity,
      required this.remark,
      required this.preparedById,
      required this.preparedByEmail,
      required this.dispatchStatus,
      required this.destination,
      this.status});

  factory Dispatch.fromJson(Map<String, dynamic> json) {
    return Dispatch(
        id: json['id'],
        referenceNo: json['reference_no'],
        allocationItemId: json['allocation_item_id'],
        transporterId: json['transporter_id'],
        transporterName: json['transporter_name'],
        plateNo: json['plate_no'],
        driverName: json['driver_name'],
        driverPhone: json['driver_phone'],
        quantity: json['quantity'],
        remark: json['remark'],
        preparedById: json['prepared_by_id'],
        preparedByEmail: json['prepared_by_email'],
        dispatchStatus: json['dispatch_status'],
        destination: json['destination']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reference_no'] = this.referenceNo;
    data['allocation_item_id'] = this.allocationItemId;
    data['transporter_id'] = this.transporterId;
    data['transporter_name'] = this.transporterName;
    data['plate_no'] = this.plateNo;
    data['driver_name'] = this.driverName;
    data['driver_phone'] = this.driverPhone;
    data['quantity'] = this.quantity;
    data['remark'] = this.remark;
    data['prepared_by_id'] = this.preparedById;
    data['prepared_by_email'] = this.preparedByEmail;
    data['dispatch_status'] = this.dispatchStatus;
    data['destination'] = this.destination;
    return data;
  }

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
    mapping['status'] = status;
    return mapping;
  }
}
