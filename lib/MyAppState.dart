import 'package:eventichs_flutter/entities/event.dart';
import 'package:eventichs_flutter/entities/organisation.dart';
import 'package:flutter/material.dart';
import 'package:eventichs_flutter/entities/user.dart';

class MyAppState extends ChangeNotifier {
  late List<User> users;
  late List<Organisation> organisations;

  MyAppState() {
    users = seedDataUsers();
    organisations = seedDataOrganisations();
  }

  List<User> seedDataUsers() {
    return <User>[
      User(
          id: 1,
          firstName: "Joe",
          lastName: "LeJoe",
          email: "joe@gmail.com",
          password: "joe"),
      User(
          id: 2,
          firstName: "Meat",
          lastName: "Man",
          email: "TheMeatMan@gmail.com",
          password: 'meatman'),
      User(
          id: 3,
          firstName: "Phillipe",
          lastName: "Gusto",
          email: "gustoP@gmail.com",
          password: "password")
    ];
  }

  List<Organisation> seedDataOrganisations() {
    return <Organisation>[
      Organisation(
          id: 1,
          userOwner: User(
              id: 1,
              firstName: "Joe",
              lastName: "LeJoe",
              email: "joe@gmail.com",
              password: "joe"),
          organisationName: "Joe Bangers & Mash"),
      Organisation(
          id: 2,
          userOwner: User(
              id: 2,
              firstName: "Meat",
              lastName: "Man",
              email: "TheMeatMan@gmail.com",
              password: 'meatman'),
          organisationName: "Meatmans's Shack"),
      Organisation(
          id: 3,
          userOwner: User(
              id: 3,
              firstName: "Phillipe",
              lastName: "Gusto",
              email: "gustoP@gmail.com",
              password: "password"),
          organisationName: "The Gusto Show")
    ];
  }

  List<Event> seedDataEvents() {
    return <Event>[
      Event(
          id: 1,
          eventHost: Organisation(
              id: 1,
              userOwner: User(
                  id: 1,
                  firstName: "Joe",
                  lastName: "LeJoe",
                  email: "joe@gmail.com",
                  password: "joe"),
              organisationName: "Joe Bangers & Mash"),
          attendies: [
            User(
                id: 2,
                firstName: "Meat",
                lastName: "Man",
                email: "TheMeatMan@gmail.com",
                password: 'meatman'),
            User(
                id: 3,
                firstName: "Phillipe",
                lastName: "Gusto",
                email: "gustoP@gmail.com",
                password: "password")
          ],
          name: "The Bang Fest!",
          description: "Hop on the bang fest! Free for all!",
          location: "36 Meyers St, Kingston, PA 18704, United States",
          startTime: DateTime.utc(2024, 10, 10, 18),
          endTime: DateTime.utc(2024, 11, 10, 0),
          isPublic: true),
      Event(
          id: 2,
          eventHost: Organisation(
              id: 2,
              userOwner: User(
                  id: 2,
                  firstName: "Meat",
                  lastName: "Man",
                  email: "TheMeatMan@gmail.com",
                  password: "meatman"),
              organisationName: "Meatmans's Shack"),
          attendies: [],
          name: "The Meat is Back!",
          description: "Grab a glimspe of the famous Meatman!",
          location: "402 Back River Neck Rd, Essex, MD 21221, United States",
          startTime: DateTime.utc(2024, 2, 22, 12),
          endTime: DateTime.utc(2024, 2, 22, 6),
          isPublic: true),
      Event(
          id: 3,
          eventHost: Organisation(
              id: 3,
              userOwner: User(
                  id: 3,
                  firstName: "Phillipe",
                  lastName: "Gusto",
                  email: "gustoP@gmail.com",
                  password: "password"),
              organisationName: "The Gusto Show"),
          attendies: [],
          name: "The Private Gusto Show!",
          description: "Private Secret Sssssh",
          location: "401 Isabella St, Pembroke, ON K8A 5N6",
          startTime: DateTime.utc(2024, 3, 10, 6),
          endTime: DateTime.utc(2024, 3, 10, 9),
          isPublic: true),
    ];
  }
}
