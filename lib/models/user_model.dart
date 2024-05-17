class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String password;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  // Convert JSON to UserModel instance
  static UserModel fromJson(Map<String, dynamic> json) {
    final userData = json['data'];
    return UserModel(
      id: userData["_id"],
      firstName: userData["firstName"],
      lastName: userData["lastName"],
      email: userData["email"],
      password: userData["password"],
    );
  }

  // Convert UserModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': {
        '_id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    };
  }
}
