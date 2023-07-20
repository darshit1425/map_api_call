import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:map_api_call/post_model.dart';

class ApiHelper {
  static final helper = ApiHelper._();

  ApiHelper._();

  Future<List> Apicall() async {
    String apilink = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(Uri.parse(apilink));
    var json = jsonDecode(response.body);

    return json.map((e) => PostModel.fromJson(e)).toList();
  }
}
