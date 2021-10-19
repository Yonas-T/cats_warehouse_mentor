import 'models.dart';
import '../repositories/repository.dart';

class NotificationDataService {
  Repository? _repository;

  NotificationDataService() {
    _repository = Repository();
  }

  savenotification(NotificationData notification) async {

    return await _repository!.insertData('notificationdata', notification.notificationMap());
  }

  readnotification() async {
    return await _repository!.readData('notificationdata');
  }

  updatenotification(NotificationData notification) async {

    return await _repository!.updateData('notificationdata', notification.notificationMap());
  }

  deletenotification(notificationId) async {
    return await _repository!.deleteData('notificationdata', notificationId);
  }
}


class DispatchService {
  Repository? _repository;

  DispatchService() {
    _repository = Repository();
  }

  savedispatch(DispatchData dispatch) async {

    return await _repository!.insertData('dispatch', dispatch.dispatchMap());
  }

  readdispatch() async {
    return await _repository!.readData('dispatch');
  }

  updatedispatch(DispatchData dispatch) async {

    return await _repository!.updateData('dispatch', dispatch.dispatchMap());
  }

  deletedispatch(dispatchId) async {
    return await _repository!.deleteData('dispatch', dispatchId);
  }
}



class ReceiptService {
  Repository? _repository;

  ReceiptService() {
    _repository = Repository();
  }

  savereceipt(ReceiptData receipt) async {

    return await _repository!.insertData('receipt', receipt.receiptMap());
  }

  readreceipt() async {
    return await _repository!.readData('receipt');
  }

  updatereceipt(ReceiptData receipt) async {

    return await _repository!.updateData('receipt', receipt.receiptMap());
  }

  deletereceipt(receiptId) async {
    return await _repository!.deleteData('receipt', receiptId);
  }
}
