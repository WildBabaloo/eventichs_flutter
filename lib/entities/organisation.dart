import 'user.dart';

class Organisation {
  int id;
  User userOwner;
  String organisationName;
  bool isPublic;

  Organisation(
      {required this.id,
      required this.userOwner,
      required this.organisationName,
      required this.isPublic});

  get getId => this.id;

  set setId(id) => this.id = id;

  get getUserOwner => this.userOwner;

  set setUserOwner(userOwner) => this.userOwner = userOwner;

  get getOrganisationName => this.organisationName;

  set setOrganisationName(organisationName) =>
      this.organisationName = organisationName;

  get getIsPublic => this.isPublic;

  set setIsPublic(isPublic) => this.isPublic = isPublic;
}
