class ApiEndpoints {
  // Using the production URL
  static const String _baseUrl =
      "https://my-lotto-api.onrender.com/api"; //พาทของ Api
  static const String login = "$_baseUrl/auth/login"; // Api Login
  static const String register = "$_baseUrl/auth/register"; // Api Register
  static const String generateTickets =
      "$_baseUrl/admin/generate-tickets"; // Api สุ่มเลข 100 lotto
  static const String drawTickets = "$_baseUrl/admin/draw"; //Api ออกรางวัล
  static const String getLatestResults =
      '$_baseUrl/admin/results/latest'; // Api ดึงข้อมูลรางวัลมาโชว์
}
