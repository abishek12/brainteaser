class UserModel {
  final String firstName;
  final String lastName;
  final String email;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          firstName: json['firstName']! as String,
          lastName: json['lastName']! as String,
          email: json['email']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
