class LoginModel {
  num userId;
  num roleId;
  String token;
  LoginModel({this.userId, this.roleId, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        userId: json['user_id'],
        roleId: json['role_id'],
        token: json['token'],
      );
}
