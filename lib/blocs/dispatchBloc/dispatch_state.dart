part of 'dispatch_bloc.dart';

abstract class DispatchState extends Equatable {
  const DispatchState();

  @override
  List<Object> get props => [];
}

class DispatchInitialState extends DispatchState {}


class DispatchFailedState extends DispatchState {
  String message;
  DispatchFailedState({required this.message});

  @override
  List<Object> get props => [];
}

class DispatchLoadingState extends DispatchState {}

class DispatchLoadedState extends DispatchState {
  Dispatch dispatchLoaded;

  DispatchLoadedState({required this.dispatchLoaded});
}

class DispatchIncrementedState extends DispatchState {
  int currentValue;

  DispatchIncrementedState({required this.currentValue});

  @override
  List<Object> get props => [];
}

class DispatchDecrementedState extends DispatchState {
  int currentValue;

  DispatchDecrementedState({required this.currentValue});

  @override
  List<Object> get props => [];
}

class DispatchDamagedIncrementedState extends DispatchState {
  int currentValue;

  DispatchDamagedIncrementedState({required this.currentValue});

  @override
  List<Object> get props => [];
}

class DispatchDamagedDecrementedState extends DispatchState {
  int currentValue;

  DispatchDamagedDecrementedState({required this.currentValue});

  @override
  List<Object> get props => [];
}

class DispatchProceedState extends DispatchState {
  List<Reciept> dispatchToConfirm;

  DispatchProceedState({required this.dispatchToConfirm});
}

class DispatchSuccessState extends DispatchState {
  Dispatch dispatchConfirmed;

  DispatchSuccessState({required this.dispatchConfirmed});
}
