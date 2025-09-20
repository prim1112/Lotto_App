// To parse this JSON data, do
//
//     final lottoticketResponse = lottoticketResponseFromJson(jsonString);
// Prim
import 'dart:convert';

List<LottoticketResponse> lottoticketResponseFromJson(String str) =>
    List<LottoticketResponse>.from(
      json.decode(str).map((x) => LottoticketResponse.fromJson(x)),
    );

String lottoticketResponseToJson(List<LottoticketResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LottoticketResponse {
  int id;
  String ticketNumber;
  String price;
  String status;

  LottoticketResponse({
    required this.id,
    required this.ticketNumber,
    required this.price,
    required this.status,
  });

  factory LottoticketResponse.fromJson(Map<String, dynamic> json) =>
      LottoticketResponse(
        id: json["id"],
        ticketNumber: json["ticket_number"],
        price: json["price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ticket_number": ticketNumber,
    "price": price,
    "status": status,
  };
}
