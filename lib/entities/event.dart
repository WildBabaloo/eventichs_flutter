import 'organisation.dart';
import 'user.dart';

class Event {
  int id;
  Organisation eventHost;
  List<User> attendies;
  String name;
  String description;
  String location;
  DateTime startTime;
  DateTime endTime;

  Event({
    required this.id,
    required this.eventHost,
    required this.attendies,
    required this.name,
    required this.description,
    required this.location,
    required this.startTime,
    required this.endTime
  });
}