import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c12_online_sun/data/model/articles_response/Articles_response.dart';
import 'package:news_app_c12_online_sun/data/model/sources_response/Source_response.dart';

class ApiManager {
  static const String _baseurl = 'newsapi.org';
  static const String _sourcesEndPoint = '/v2/top-headlines/sources';
  static const String _articlesEndPoint = '/v2/everything';
  static const String _apikey = '52daa7491918420b95f40b305c08056c';

  static Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(_baseurl, _sourcesEndPoint, {
      'apiKey': _apikey,
      'category': categoryId,
    });
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  static Future<ArticlesResponse> getArticles(String sourceId,String searchText) async {
    Uri url = Uri.https(_baseurl, _articlesEndPoint, {
      'apiKey': _apikey,
      'sources': sourceId,
      'q': searchText,
    });
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse =ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}
