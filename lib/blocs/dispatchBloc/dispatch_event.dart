part of 'dispatch_bloc.dart';

abstract class DispatchEvent extends Equatable {
  const DispatchEvent();

  @override
  List<Object> get props => [];
}

class DispatchFetchEvent extends DispatchEvent {
}


class CountIncrement extends DispatchEvent {
  int currentValue;

  CountIncrement({required this.currentValue});
}

class CountDecrement extends DispatchEvent {
  int currentValue;

  CountDecrement({required this.currentValue});

  @override
  List<Object> get props => [currentValue];
}

class DamagedCountIncrement extends DispatchEvent {
  int currentValue;

  DamagedCountIncrement({required this.currentValue});
  @override
  List<Object> get props => [currentValue];
}

class DamagedCountDecrement extends DispatchEvent {
  int currentValue;

  DamagedCountDecrement({required this.currentValue});
  @override
  List<Object> get props => [currentValue];
}

class StartCount extends DispatchEvent {
  Notifications notificationDataToCount;

  StartCount({required this.notificationDataToCount});

  @override
  List<Object> get props => [notificationDataToCount];
}

// class CountBatchSize extends DispatchEvent {}

class FinishCount extends DispatchEvent {
  Dispatch dispatchToConfirm;

  FinishCount({required this.dispatchToConfirm});

  @override
  List<Object> get props => [dispatchToConfirm];
}

class WarehouseManagerConfirm extends DispatchEvent {
  Dispatch dispatchConfirmed;

  WarehouseManagerConfirm({required this.dispatchConfirmed});
  @override
  List<Object> get props => [dispatchConfirmed];
}

class Submit extends DispatchEvent {}
