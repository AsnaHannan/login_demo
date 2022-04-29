import 'package:http/http.dart' as http;
import 'package:vs_firstapp/models/user_model.dart';

class NetworkCalls {
  static var client = http.Client();

  static Future<List<UserModel>> fetchUsers() async {
    var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return userModelFromJson(jsonString);
    } else {
       throw Exception(response.body);
    }
  }

}
