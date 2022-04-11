import 'package:http/http.dart' as http;
import 'package:inst_mobile/data/http_headers.dart';
import 'package:inst_mobile/data/models/commentary.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class CommentaryApi {
  Future<http.Response> createCommentary(PostCommentary commentary) async {
    var response = await http.post(
        Uri.parse('${AppStrings.apiUrl}/commentary',),
        headers: HttpHeaders.baseHeaders,
        body: commentary.toJson());
    return response;
  }

  Future<http.Response> getPostsCommentary(int postId) async {
    var response = await http.get(Uri.parse('${AppStrings.apiUrl}/commentaries'));
    return response;
  }
}