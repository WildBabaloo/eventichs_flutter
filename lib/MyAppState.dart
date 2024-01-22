import 'package:eventichs_flutter/entities/organisation.dart';
import 'package:flutter/material.dart';
import 'entities/user.dart';

class MyAppState extends ChangeNotifier {
  late List<User> users;
  late List<Organisation> organisations;

  MyAppState() {
    users = seedDataUsers();
    organisations = seedDataOrganisations();
  }

  List<User> seedDataUsers() {
      return <User>[
          User(id: 1, firstName: "Joe", lastName: "LeJoe", email: "joe@gmail.com", password: "joe"),
          User(id: 2, firstName: "Meat", lastName: "Man", email: "TheMeatMan@gmail.com", password: 'meatman'),
          User(id: 3, firstName: "Phillipe", lastName: "Gusto", email: "gustoP@gmail.com", password: "password")
      ];
  }

  List<Organisation> seedDataOrganisations() {
    return <Organisation>[
      Organisation(id: 1, userOwner: User(id: 1, firstName: "Joe", lastName: "LeJoe", email: "joe@gmail.com", password: "joe"), organisationName: "Joe Bangers & Mash", isPublic: true),
      Organisation(id: 2, userOwner: User(id: 2, firstName: "Meat", lastName: "Man", email: "TheMeatMan@gmail.com", password: 'meatman'), organisationName: "Meatmans's Shack", isPublic: true),
      Organisation(id: 3, userOwner: User(id: 3, firstName: "Phillipe", lastName: "Gusto", email: "gustoP@gmail.com", password: "password"), organisationName: "The Gusto Show", isPublic: false)
    ];
  }

}