import 'dart:convert';
import 'package:inst_mobile/data/http_headers.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<Map<int, String>> authorize(
      Map<String, String> loginInfo) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(AppStrings.api_url + '/login'))
          ..headers.addAll(HttpHeaders.loginHeaders)
          ..fields.addAll(loginInfo);
    var resp = (await request.send());
    var response = <int, String>{};
    response[resp.statusCode] = await resp.stream.bytesToString();
    return response;
  }

  static Future<http.Response> createUser(PostUser user) async {
    var response = await http.post(Uri.parse(AppStrings.api_url + '/user'),
        body: jsonEncode(user.toJson()));
    return response;
  }

  static Future<http.Response> getAllUsers() async {
    var response = await http.get(Uri.parse(AppStrings.api_url + '/users'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  static Future<http.Response> getUserByLogin(String login) async {
    var response = await http.get(
        Uri.parse(AppStrings.api_url + '/user/login?login=$login)'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  static Future<http.Response> getUserByNickname(String nickname) async {
    var response = await http.get(
        Uri.parse(AppStrings.api_url + '/user/nickname?nickname=$nickname'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  static Future<http.Response> getUserById(int id) async {
    var response = await http.get(
        Uri.parse(AppStrings.api_url + '/user/id?id=$id'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  static Future<http.Response> getMe() async {
    var response = await http.get(Uri.parse(AppStrings.api_url + '/me'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  static Future<http.Response> followUser(int followedId) async {
    var response = await http.patch(
        Uri.parse(AppStrings.api_url + '/follow?followed_id=$followedId'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  static Future<http.Response> unfollowUser(int unfollowedId) async {
    var response = await http.patch(
        Uri.parse(AppStrings.api_url + '/unfollow?unfollowed_id=$unfollowedId'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  static Future<http.Response> updateMe(PatchUser user) async {
    var response = await http.patch(Uri.parse(AppStrings.api_url + '/me'),
        body: jsonEncode(user.toJson()),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

}
