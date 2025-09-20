class ApiEndpoints {
  // Using the production URL
  static const String _baseUrl = "https://my-lotto-api.onrender.com/api";
  static const String login = "$_baseUrl/auth/login";
  static const String register = "$_baseUrl/auth/register";
  // ApiEndpoint for generating tickets
  static const String generateTickets = "$_baseUrl/admin/generate-tickets";
  static const String drawTickets = "$_baseUrl/admin/draw";
  static const String getLatestResults = '$_baseUrl/admin/results/latest';

  // prim
  static const String getAllTickets = "$_baseUrl/admin/tickets";
  static const String purchaseTicket = "$_baseUrl/purchase";
}
