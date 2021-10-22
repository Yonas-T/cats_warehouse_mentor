import 'package:cats_warehouse_mentor/blocs/loginBloc/loginbloc_bloc.dart';
import 'package:cats_warehouse_mentor/constants/colors.dart';
import 'package:cats_warehouse_mentor/constants/constants.dart';
import 'package:cats_warehouse_mentor/repositories/dispatchRepository.dart';
import 'package:cats_warehouse_mentor/screens/dispatchConfirmationScreen/dispatchConfirmationScreen.dart';
import 'package:cats_warehouse_mentor/screens/dispatchListingScreen/dispatchListingScreen.dart';
import 'package:cats_warehouse_mentor/utils/helperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  DispatchRepository dispatchRepository = DispatchRepository();
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode passfocus = FocusNode();
  late LoginblocBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginblocBloc>(context);

    return ListView(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        children: [
          SizedBox(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(fontSize: 48, color: kNavy)),
            ],
          ),
          SizedBox(height: 32),
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: emailController,
                      style: TextStyle(color: kNavy),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: kWhite.withOpacity(0.4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                            color: Colors.black, fontSize: kNormalFont),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (text) => validateEmail(text),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: kNavy),
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: kWhite.withOpacity(0.4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.black, fontSize: kNormalFont),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (text) => validatePassword(text),
                    ),
                  ),
                  SizedBox(height: 32),
                  BlocListener<LoginblocBloc, LoginblocState>(
                    listener: (context, state) {
                      print(state);
                      if (state is LoginSuccessState) {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) {
                          return DispatchListingScreen(
                              dispatchRepository: widget.dispatchRepository);
                        }));
                      }
                    },
                    child: BlocBuilder<LoginblocBloc, LoginblocState>(
                      builder: (context, state) {
                        if (state is LoginFailState) {
                          return Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: kButtonHeight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kNavy,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16))),
                                  child: Text('Retry',
                                      style: TextStyle(
                                          fontSize: kButtonFont,
                                          color: Colors.white)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      loginBloc.add(
                                        LoginButtonPressed(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                      FocusScope.of(context)
                                          .requestFocus(passfocus);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Can\'t Login, Try Again',
                                      style: TextStyle(
                                          fontSize: kButtonFont,
                                          color: Colors.red))
                                ],
                              )
                            ],
                          );
                        }
                        if (state is LoginLoadingState) {
                          return Center(
                              child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(kNavy)));
                        }
                        if (state is LoginblocInitial) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: kButtonHeight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: kNavy,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                              child: Text("Login",
                                  style: TextStyle(
                                      fontSize: kButtonFont,
                                      color: Colors.white)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  loginBloc.add(
                                    LoginButtonPressed(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                  FocusScope.of(context)
                                      .requestFocus(passfocus);
                                }
                              },
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: kButtonHeight,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //         primary: Colors.blueGrey,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(16))),
                    //     child: Text("Login",
                    //         style: TextStyle(fontSize: kNormalFont, color: Colors.black)),
                    //     onPressed: () {
                    //       if (_formKey.currentState!.validate()) {
                    //         // loginBloc.add(
                    //         //   LoginButtonPressed(
                    //         //     email: emailController.text,
                    //         //     password: passwordController.text,
                    //         //   ),
                    //         // );
                    //         FocusScope.of(context).requestFocus(passfocus);
                    //       }
                    //     },
                    //   ),
                    // ),
                  ),
                ],
              )),
        ]);
  }
}
