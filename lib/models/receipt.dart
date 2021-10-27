class Reciept {
  ReceiptData recieptData;

  Reciept({required this.recieptData});

  factory Reciept.fromJson(Map<String, dynamic> parsedJson) {
    return Reciept(recieptData: parsedJson['payload']);
  }
}

class ReceiptData {
  String commodityStatus;
  int dispatchId;
  int quantity;
  String remark;
  int preparedById;

  ReceiptData(
      {required this.commodityStatus,
      required this.dispatchId,
      required this.preparedById,
      required this.quantity,
      required this.remark});

  factory ReceiptData.fromJson(Map<String, dynamic> parsedJson) {
    return ReceiptData(
        commodityStatus: parsedJson['commodity_status'],
        dispatchId: parsedJson['dispatch_id'],
        quantity: parsedJson['quantity'],
        remark: parsedJson['remark'],
        preparedById: parsedJson['prepared_by_id']);
  }

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
