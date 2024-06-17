// class APIConstant {
//   static String url = 'http://192.168.137.1:8000/api/v1';
//   static Map<String, String> auth(String token) => {
//         // "X-IPChecker-Bypass": 'true',
//         "Authorization": "Bearer $token",
//       };
// }


// class APIConstant{
//   static String moodleUrl = 'http://localhost/my/';

//   static Map<String, String> authHeaders(){
//     return{
//       'Content-Type': 'appliaction/json',
//     };
//   }
// } 

class APIConstant {
  static String url = "http://localhost/my/";
  

  static Map<String, String> auth(String token) {
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }
}