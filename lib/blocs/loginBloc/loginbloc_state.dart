part of 'loginbloc_bloc.dart';

abstract class LoginblocState extends Equatable {
  const LoginblocState();
  
  @override
  List<Object> get props => [];
}

class LoginblocInitial extends LoginblocState {}

class LoginLoadingState extends LoginblocInitial {}

class LoginSuccessState extends LoginblocInitial {

  UserCred user;

  LoginSuccessState(this.user);

  @override
  List<Object> get props => [];
}

class LoginFailState extends LoginblocInitial {

  String message;

  LoginFailState(this.message);

  @override
  List<Object> get props => [];
}