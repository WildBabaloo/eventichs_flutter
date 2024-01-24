import 'user.dart';

class Organisation {
  int id;
  User userOwner;
  String organisationName;

  Organisation(
      {required this.id,
      required this.userOwner,
      required this.organisationName,});

  get getId => id;

  set setId(id) => this.id = id;

  get getUserOwner => userOwner;

  set setUserOwner(userOwner) => this.userOwner = userOwner;

  get getOrganisationName => organisationName;

  set setOrganisationName(organisationName) =>
      this.organisationName = organisationName;
}
