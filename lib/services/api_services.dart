import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:state_management/model/api_model.dart';
import 'package:state_management/utilities/api_url.dart';

class AppServices {
  static final http.Client _client = http.Client();

  static Future<List<PostModel>?> getPosts() async {
    final url = Uri.parse(AppUrls.baseUrl + AppUrls.postPath);
    try {
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      log("An Error Occured while executing  Posts $e");
    }
    return null;
  }
}
