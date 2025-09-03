import 'dart:convert';

// Function to convert the model to a JSON string
String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String username;
  String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() => {"username": username, "password": password};
}
