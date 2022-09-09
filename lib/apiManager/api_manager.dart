import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/TopRatedResponse.dart';

class ApiManager{
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = 'a6c404179ede61ad21d79677a7366c47';



  static Future<TopRatedResponse> topRated()async{
    var uri = Uri.https(baseUrl, '/3/movie/top_rated',{
      'api_key' : apiKey
    });
    var response = await http.get(uri);
    if(response.statusCode == 200) {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return TopRatedResponse.fromJson(json);
    }
    throw Exception('error');
  }

}