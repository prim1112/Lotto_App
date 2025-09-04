import 'dart:convert';

// Function to convert the model to a JSON string
String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String email;
  String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
