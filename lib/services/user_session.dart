// lib/services/user_session.dart
import 'package:lotto_application/model/response/login_response_model.dart';

class UserSession {
  // สร้าง instance เดียวเพื่อให้ใช้ร่วมกันทั้งแอป
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;
  UserSession._internal();

  // ตัวแปรสำหรับเก็บข้อมูล User ที่ล็อกอินสำเร็จ
  User? currentUser;
}
