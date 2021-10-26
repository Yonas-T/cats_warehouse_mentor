import 'dart:convert';

class UserCred {
  UserAuth? user;
  String token;

  UserCred({required this.user, required this.token});

  factory UserCred.fromJson(Map<String, dynamic> parsedJson) {
    return UserCred(
        token: parsedJson['token'],
        user: parsedJson['user'] != null
            ? UserAuth.fromJson(parsedJson['user'])
            : null
        );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    data['user'] = this.user!.toJson();
    return data;
  }
}

class UserAuth {
  int id;
  String email;
  String firstName;
  String lastName;
  List roles;

  UserAuth(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.roles});

  factory UserAuth.fromJson(Map<String, dynamic> parsedJson) {
    return UserAuth(
      id: parsedJson['id'],
      email: parsedJson['email'],
      firstName: parsedJson['first_name'],
      lastName: parsedJson['last_name'],
      roles: parsedJson['roles'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['roles'] = this.roles;
    return data;
  }
}
