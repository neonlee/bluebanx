class UserEntity {
  final String? email;
  final String? name;

  UserEntity({
    this.email,
    this.name,
  });
  static final empty = UserEntity();
}
