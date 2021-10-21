part of 'authbloc_bloc.dart';

abstract class AuthblocState extends Equatable {
  const AuthblocState();

  @override
  List<Object> get props => [];
}

class AuthblocInitial extends AuthblocState {}

class AuthenticatedState extends AuthblocState {
  String token;

  AuthenticatedState({required this.token});

  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AuthblocState {
  String message;

  UnauthenticatedState(this.message);

  @override
  List<Object> get props => [];
}
