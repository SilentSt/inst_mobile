import 'package:http/http.dart' as http;
import 'package:inst_mobile/resources/app_strings.dart';

import '../http_headers.dart';

class HistoryApi {
  Future<http.Response> createHistory(
      {required DateTime datetime,
        required String filePath}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${AppStrings.apiUrl}/history?date=$datetime'),
    );
    request.headers.addAll(HttpHeaders.fileUploadingHeaders);
    request.files.add(http.MultipartFile.fromString('document', filePath));
    var response = await http.Response.fromStream(await request.send());
    return response;
  }

  Future<http.Response> getHistory()async{
    var response = await http.get(Uri.parse(AppStrings.apiUrl+'/histories'), headers: HttpHeaders.baseHeaders);
    return response;
  }

  Future<http.Response> getAuthoredHistory(int authorId)async{
    var response = await http.get(Uri.parse(AppStrings.apiUrl+'/histories/authored?author_id=$authorId'), headers: HttpHeaders.baseHeaders);
    return response;
  }

  Future<http.Response> getFollowingHistory()async{
    var response = await http.get(Uri.parse('${AppStrings.apiUrl}/histories/following'), headers: HttpHeaders.baseHeaders);
    return response;
  }
}
