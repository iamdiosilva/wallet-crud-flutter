class UserModel {
  int id;
  String userName;
  String email;
  String userPassword;
  String nickname;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.userPassword,
    required this.nickname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      userName: json['user_name'] as String,
      email: json['email'] as String,
      userPassword: json['user_password'] as String,
      nickname: json['nickname'] as String,
    );
  }
}
