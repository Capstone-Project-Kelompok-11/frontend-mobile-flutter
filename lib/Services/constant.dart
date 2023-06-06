class APIConstant {
  static String url = 'https://skfw.net/api/v1';
  static Map<String, String> auth(String token) => {
        "X-IPChecker-Bypass": 'true',
        "Authorization": "Bearer $token",
      };
}
