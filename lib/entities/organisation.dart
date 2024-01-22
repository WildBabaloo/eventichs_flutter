import 'user.dart';

class Organisation {
  int id;
  User userOwner;
  String organisationName;

  Organisation(
      {required this.id,
      required this.userOwner,
      required this.organisationName,});

  get getId => this.id;

  set setId(id) => this.id = id;

  get getUserOwner => this.userOwner;

  set setUserOwner(userOwner) => this.userOwner = userOwner;

  get getOrganisationName => this.organisationName;

  set setOrganisationName(organisationName) =>
      this.organisationName = organisationName;
}
