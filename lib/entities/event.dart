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
  get getId => this.id;

  Event(
      {required this.id,
      required this.eventHost,
      required this.attendies,
      required this.name,
      required this.description,
      required this.location,
      required this.startTime,
      required this.endTime});

  set setId(id) => this.id = id;

  get getEventHost => this.eventHost;

  set setEventHost(eventHost) => this.eventHost = eventHost;

  get getAttendies => this.attendies;

  set setAttendies(attendies) => this.attendies = attendies;

  get getName => this.name;

  set setName(name) => this.name = name;

  get getDescription => this.description;

  set setDescription(description) => this.description = description;

  get getLocation => this.location;

  set setLocation(location) => this.location = location;

  get getStartTime => this.startTime;

  set setStartTime(startTime) => this.startTime = startTime;

  get getEndTime => this.endTime;

  set setEndTime(endTime) => this.endTime = endTime;
}
