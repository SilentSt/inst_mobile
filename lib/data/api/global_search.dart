import 'package:http/http.dart' as http;
import 'package:inst_mobile/data/http_headers.dart';
import 'package:inst_mobile/resources/app_strings.dart';


class GlobalSearchApi{
  static Future<http.Response> find(String searchStr) async {
    var url = '';
    if(searchStr.isEmpty)
      {
        url = '${AppStrings.apiUrl}/users';
      }
    else{
      url = '${AppStrings.apiUrl}/users?nickname=$searchStr';
    }
    var response = await http.get(Uri.parse(url), headers: HttpHeaders.baseHeaders);
    return response;
  }
}