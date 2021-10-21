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
