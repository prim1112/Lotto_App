import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  String message;
  User user;

  LoginResponse({required this.message, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );
}

class User {
  int userId;
  String username;
  String walletBalance;
  String role;
  String email;

  User({
    required this.userId,
    required this.username,
    required this.walletBalance,
    required this.role,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    username: json["username"],
    walletBalance: json["wallet_balance"],
    role: json["role"],
    email: json["email"],
  );
}
