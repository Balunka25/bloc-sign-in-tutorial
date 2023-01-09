class UserEntity {
  final String email;

  UserEntity({
    required this.email,
  });

  UserEntity.empty() : email = "";

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      email: map["email"] ?? "",
    );
  }
}
