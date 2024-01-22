import 'user.dart';

class Organisation {
  int id;
  User userOwner;
  String organisationName;
  bool isPublic;

  Organisation({
    required this.id,
    required this.userOwner,
    required this.organisationName,
    required this.isPublic
  });
}