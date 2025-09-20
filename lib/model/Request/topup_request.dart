import 'dart:convert';

// แปลง JSON เป็น TopupRequest
TopupRequest topupRequestFromJson(String str) =>
    TopupRequest.fromJson(json.decode(str));

// แปลง TopupRequest เป็น JSON
String topupRequestToJson(TopupRequest data) => json.encode(data.toJson());

class TopupRequest {
  int userId;
  double amount; // ✅ เปลี่ยนเป็น double

  TopupRequest({
    required this.userId,
    required this.amount,
  });

  factory TopupRequest.fromJson(Map<String, dynamic> json) {
    return TopupRequest(
      userId: int.parse(json["userId"].toString()), 
      amount: double.tryParse(json["amount"].toString()) ?? 0.0, // ✅ กัน string และ int
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "amount": amount,
      };
}
