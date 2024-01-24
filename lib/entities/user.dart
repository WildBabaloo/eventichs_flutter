
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

  get getId => id;

  set setId(id) => this.id = id;

  get getFirstName => firstName;

  set setFirstName(firstName) => this.firstName = firstName;

  get getLastName => lastName;

  set setLastName(lastName) => this.lastName = lastName;

  get getEmail => email;

  set setEmail(email) => this.email = email;

  get getPassword => password;

  set setPassword(password) => this.password = password;
}
