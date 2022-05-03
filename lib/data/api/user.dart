import 'dart:convert';
import 'package:inst_mobile/data/http_headers.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:http/http.dart' as http;

class UserApi {
  ///Authorize function
  ///
  /// awaiting for Map<String, String>{'username':<your_username>,'password':<your_password>}
  ///
  /// returning Response, where you`ll find status code and token in body
  static Future<http.Response> authorize(Map<String, String> loginInfo) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(AppStrings.apiUrl + '/login'))
          ..headers.addAll(HttpHeaders.loginHeaders)
          ..fields.addAll(loginInfo);
    print(request);
    var resp = (await request.send());
    var response = await http.Response.fromStream(resp);
    return response;
  }

  static Future<http.Response> createUser(CreateUser user) async {
    var response = await http.post(Uri.parse(AppStrings.apiUrl + '/users'),
        body: jsonEncode(user.toJson()), headers: HttpHeaders.registerHeaders);
    return response;
  }

  static Future<http.Response> getAllUsers() async {
    var response = await http.get(Uri.parse(AppStrings.apiUrl + '/users'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  // static Future<http.Response> getUserByLogin(String login) async {
  //   var response = await http.get(
  //       Uri.parse(AppStrings.apiUrl + '/user/login?login=$login)'),
  //       headers: HttpHeaders.baseHeaders);
  //   return response;
  // }
  //
  // static Future<http.Response> getUserByNickname(String nickname) async {
  //   var response = await http.get(
  //       Uri.parse(AppStrings.apiUrl + '/user/nickname?nickname=$nickname'),
  //       headers: HttpHeaders.baseHeaders);
  //   return response;
  // }

  static Future<http.Response> getUserByUuid(String uuid) async {
    var response = await http.get(Uri.parse(AppStrings.apiUrl + '/users/$uuid'),
        headers: HttpHeaders.noContentHeaders);
    return response;
  }

  static Future<http.Response> getMe() async {
    var response = await http.get(Uri.parse(AppStrings.apiUrl + '/me'),
        headers: HttpHeaders.noContentHeaders);
    return response;
  }

  static Future<http.Response> followUser(String followedId) async {
    var response = await http.post(
        Uri.parse(AppStrings.apiUrl + '/users/$followedId/follow'),
        headers: HttpHeaders.noContentHeaders);
    return response;
  }

  static Future<http.Response> unfollowUser(String unfollowedId) async {
    var response = await http.delete(
        Uri.parse(AppStrings.apiUrl + '/users/$unfollowedId/follow'),
        headers: HttpHeaders.noContentHeaders);
    return response;
  }

  static Future<http.Response> updateMe(
      {required String filePath,
      required String email,
      required String password,
      required String bio}) async {
    var request = http.MultipartRequest(
        'PATCH', Uri.parse(AppStrings.apiUrl + '/users/${TempData.me!.uuid}'))
      ..headers.addAll(HttpHeaders.fileUploadingHeaders)
      ..fields.addAll({'email': email, 'password': password, 'bio': bio})
      ..files.add(await http.MultipartFile.fromPath('file', filePath));
    var resp = await request.send();
    var response = http.Response.fromStream(resp);
    return response;
  }
}
