import 'package:eventichs_flutter/entities/organisation.dart';
import 'package:flutter/material.dart';
import 'entities/user.dart';

class MyAppState extends ChangeNotifier {
  late List<User> users;

  MyAppState() {
    users = seedDataUsers();
  }

  List<User> seedDataUsers() {
      return <User>[
          User(id: 1, firstName: "Joe", lastName: "LeJoe", email: "joe@gmail.com", password: "joe"),
          User(id: 2, firstName: "Meat", lastName: "Man", email: "TheMeatMan@gmail.com", password: 'meatman'),
          User(id: 3, firstName: "Phillipe", lastName: "Gusto", email: "gustoP@gmail.com", password: "password")
      ];
  }

  //List<Organisation> seedDataOrganisations() {
    //return <Organisation>[
      //Organisation(id: 1, userOwner: , organisationName: organisationName, isPublic: isPublic)
    //]
  //}

}