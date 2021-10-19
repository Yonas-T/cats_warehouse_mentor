part of 'authbloc_bloc.dart';

abstract class AuthblocState extends Equatable {
  const AuthblocState();

  @override
  List<Object> get props => [];
}

class AuthblocInitial extends AuthblocState {}

class AuthenticatedState extends AuthblocState {
  UserCred user;

  AuthenticatedState({required this.user});

  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AuthblocState {
  String message;

  UnauthenticatedState(this.message);

  @override
  List<Object> get props => [];
}
