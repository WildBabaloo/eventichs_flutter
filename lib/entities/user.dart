import 'package:provider/provider.dart';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  get getId => this.id;

  set setId(id) => this.id = id;

  get getFirstName => this.firstName;

  set setFirstName(firstName) => this.firstName = firstName;

  get getLastName => this.lastName;

  set setLastName(lastName) => this.lastName = lastName;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  get getPassword => this.password;

  set setPassword(password) => this.password = password;
}
