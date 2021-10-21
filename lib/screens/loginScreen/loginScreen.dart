import 'package:cats_warehouse_mentor/blocs/loginBloc/loginbloc_bloc.dart';
import 'package:cats_warehouse_mentor/constants/colors.dart';
import 'package:cats_warehouse_mentor/repositories/authRepositories.dart';
import 'package:cats_warehouse_mentor/screens/loginScreen/widgets/formWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  AuthRepository? authRepository;

  LoginScreen({required this.authRepository});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    BlocProvider(
      create: (context) => LoginblocBloc(authRepository: widget.authRepository),
      child: LoginScreenChild(authRepository: widget.authRepository),
    );
  }
}

class LoginScreenChild extends StatefulWidget {
  AuthRepository? authRepository;

  LoginScreenChild({required this.authRepository});
  @override
  _LoginScreenChildState createState() => _LoginScreenChildState();
}

class _LoginScreenChildState extends State<LoginScreenChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: FormWidget(),
      ),
    );
  }
}
