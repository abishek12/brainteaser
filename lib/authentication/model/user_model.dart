class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
  });

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          firstName: json['firstName']! as String,
          lastName: json['lastName']! as String,
          email: json['email']! as String,
          gender: json['gender']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
    };
  }
}
