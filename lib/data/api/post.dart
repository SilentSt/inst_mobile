import 'package:http/http.dart' as http;
import 'package:inst_mobile/data/http_headers.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class PostApi {
  Future<http.Response> createPost(
      {required String title,
      required String description,
      required DateTime datetime,
      required String filePath}) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(AppStrings.apiUrl +
            '/post?title=$title&description=$description&datetime=$datetime'));
    request.headers.addAll(HttpHeaders.fileUploadingHeaders);
    request.files.add(http.MultipartFile.fromString('document', filePath));
    var response = await http.Response.fromStream(await request.send());
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
