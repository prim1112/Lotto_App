import 'dart:convert';

TopupResponse topupResponseFromJson(String str) =>
    TopupResponse.fromJson(json.decode(str));

String topupResponseToJson(TopupResponse data) => json.encode(data.toJson());

class TopupResponse {
  String message;
  double newBalance; // ✅ ใช้ double

  TopupResponse({
    required this.message,
    required this.newBalance,
  });

  factory TopupResponse.fromJson(Map<String, dynamic> json) {
    return TopupResponse(
      message: json["message"] ?? '',
      newBalance: double.tryParse(json["newBalance"].toString()) ??
          0.0, // ✅ รองรับทั้ง int, double, string
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "newBalance": newBalance,
      };
}
