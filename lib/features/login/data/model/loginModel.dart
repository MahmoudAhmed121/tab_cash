class LoginModel {
  String refresh;
  String access;

  LoginModel({
    required this.refresh,
    required this.access,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        refresh: json["refresh"],
        access: json["access"],
      );
}
