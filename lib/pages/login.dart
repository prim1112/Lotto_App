import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_application/pages/customer/homepage.dart';
import 'dart:convert';
import 'package:lotto_application/pages/register.dart';
import 'package:lotto_application/pages/owner/Owner_draw.dart';
import 'package:lotto_application/model/request/login_request_model.dart';
import 'package:lotto_application/model/response/login_response_model.dart';
import 'package:lotto_application/config/api_endpoints.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // NOTE: Removed unused 'username' and 'url' variables for clarity
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // NOTE: Removed duplicate @override annotation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      // CHANGED: Simplified the widget tree for robust centering
      body: SafeArea(
        child: Center(
          // 1. Center widget to place its child in the middle of the screen
          child: SingleChildScrollView(
            // 2. SingleChildScrollView to allow scrolling when keyboard appears
            child: Container(
              width: 280,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(color: Colors.black, width: 1), // Removed border to match design
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      fontSize: 24, // Increased font size for title
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20), // Adjusted spacing
                  buildTextField(
                    'อีเมล', // Changed to Thai to match screenshot
                    'กรอกอีเมล',
                    controller: email,
                  ),
                  const SizedBox(height: 25),
                  buildTextField(
                    'รหัสผ่าน',
                    'กรอกรหัสผ่าน',
                    controller: password,
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  buildButtonRow(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    String hint, {
    bool obscureText = false,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 10.0,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ],
    );
  }

  Widget buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween, // Use spaceBetween for better alignment
      children: [
        TextButton(
          onPressed: _register,
          child: const Text(
            'สมัครสมาชิก',
            style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        // NOTE: No need for SizedBox here if using spaceBetween
        buildButton(
          context,
          'เข้าสู่ระบบ',
          const Color(0xFFFFF59D),
          Colors.black,
          _login, // CHANGED: Now calls the correct _login function
        ),
      ],
    );
  }

  Widget buildButton(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 120, // Increased width for better text fit
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          foregroundColor: textColor,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            // side: const BorderSide(color: Colors.black, width: 1),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  // CHANGED: This is the function for the login button
  void _login() async {
    try {
      // 1. Create a request model instance
      final requestModel = LoginRequest(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      final response = await http.post(
        Uri.parse(ApiEndpoints.login),
        headers: {'Content-Type': 'application/json'},
        // 2. Use the generated function to convert the model to a JSON string
        body: loginRequestToJson(requestModel),
      );

      if (response.statusCode == 200) {
        // --- Login Successful ---
        // 3. Use the generated function to parse the response string into a model
        final loginResponse = loginResponseFromJson(response.body);
        final String userRole =
            loginResponse.user.role; // 4. Access data safely

        log(
          'Login successful for user: ${loginResponse.user.username}, role: $userRole',
        );

        if (userRole == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OdrawPage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
          );
        }
      } else {
        // --- Login Failed ---
        final responseData = jsonDecode(response.body);
        final String errorMessage =
            responseData['message'] ?? 'An unknown error occurred.';
        log('Login failed: $errorMessage');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    } catch (e) {
      // --- Network or other exceptions ---
      log('An error occurred during login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not connect to the server.')),
      );
    }
  }

  // CHANGED: Renamed function to follow convention
  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }
}
