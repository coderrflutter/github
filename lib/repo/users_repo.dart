import "package:github_project/model/users_model.dart";
import "package:http/http.dart" as http;

class UsersRepo {
  Future<List<UsersModel>> getUsers() async {
    var response =
        await http.get(Uri.parse("https://api.github.com/users?since=0"));
    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else {
      throw Exception("failed to load name list");
    }
  }
}
