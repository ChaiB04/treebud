

class User{
  String id;
  String username;
  String password;

  User(this.id, this.username, this.password);

  factory User.refactor(Map<String, dynamic> map) {
    return User(
      map['id'] as String,
      map['username'] as String,
      map['password'] as String,
    );
  }
}