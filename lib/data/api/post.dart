import 'package:http/http.dart' as http;
import 'package:inst_mobile/data/http_headers.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class PostApi {
  Future<http.Response> createPost(
      {required String title,
      required String description,
      required List<String> files}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(AppStrings.apiUrl + '/posts'))
          ..headers.addAll(HttpHeaders.fileUploadingHeaders)
          ..fields.addAll({'title': title, 'description': description});
    for (var f in files) {
      request.files.add(await http.MultipartFile.fromPath('file', f));
    }
    print(request);
    print(request.fields);
    print(request.files);
    var response = await http.Response.fromStream(await request.send());
    print(response.statusCode);
    print(response.body);
    return response;
  }

  Future<http.Response> getPosts() async {
    var response = await http.get(Uri.parse(AppStrings.apiUrl + '/posts'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  Future<http.Response> getDetailedPost(String uuid) async {
    var response = await http.get(
        Uri.parse(AppStrings.apiUrl + '/posts/' + uuid),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  Future<http.Response> likePost(String uuid) async {
    var response = await http.post(
        Uri.parse('${AppStrings.apiUrl}/posts/$uuid/like'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  Future<http.Response> removeLikePost(String uuid) async {
    var response = await http.delete(
        Uri.parse('${AppStrings.apiUrl}/posts/$uuid/like'),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

  Future<http.Response> getUsersPost(String uuid) async {
    var response = await http.get(
        Uri.parse(AppStrings.apiUrl + '/posts?user_uuid=' + uuid),
        headers: HttpHeaders.baseHeaders);
    return response;
  }

// Future<http.Response> getAuthoredPosts(int authorId)async{
//   var response = await http.get(Uri.parse(AppStrings.apiUrl+'/posts/authored?author_id=$authorId'), headers: HttpHeaders.baseHeaders);
//   return response;
// }
//
// Future<http.Response> getFollowingPosts()async{
//   var response = await http.get(Uri.parse('${AppStrings.apiUrl}/posts/followed'), headers: HttpHeaders.baseHeaders);
//   return response;
// }
}
