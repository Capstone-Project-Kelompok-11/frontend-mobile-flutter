class APIConstant {
  static String url = 'http://192.168.0.56:8000/api/v1';
  static Map<String, String> auth(String token) => {
        // "X-IPChecker-Bypass": 'true',
        "Authorization": "Bearer $token",
      };
}
