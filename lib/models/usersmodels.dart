class UserModels {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String imageUrl;

  UserModels({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.imageUrl,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        id: json['id'],
        imageUrl: json['avatar'],
      );
}
