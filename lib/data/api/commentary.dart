import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inst_mobile/data/http_headers.dart';
import 'package:inst_mobile/data/models/commentary.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class CommentaryApi {
  Future<http.Response> createCommentary(PostCommentary commentary, String postUuid) async {
    print(jsonEncode(commentary.toJson()));
    print('${AppStrings.apiUrl}/comments/$postUuid');
    var response = await http.post(
        Uri.parse('${AppStrings.apiUrl}/comments/$postUuid'),
        headers: HttpHeaders.baseHeaders,
        body: jsonEncode(commentary.toJson()));
    return response;
  }

  Future<http.Response> getPostsCommentary(String postUuid) async {
    var response = await http.get(Uri.parse('${AppStrings.apiUrl}/comments/$postUuid'), headers: HttpHeaders.baseHeaders);
    return response;
  }

  Future<http.Response> likeComment(String uuid) async {
    var response = await http.post(
        Uri.parse('${AppStrings.apiUrl}/comments/$uuid/like'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  Future<http.Response> removeCommentLike(String uuid) async {
    var response = await http.delete(
        Uri.parse('${AppStrings.apiUrl}/comments/$uuid/like'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }
}