import "dart:convert";

import "package:api_placeholder/models/todo_model.dart";
import "package:http/http.dart" as http;

class TodoRepository {
  Future<dynamic> getAll() async {
    const url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final resultData = json.map((data) {
        return TodoModel(
            id: data["id"],
            userId: data["userId"],
            title: data["title"],
            completed: data["completed"]);
      }).toList();
      return resultData;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
