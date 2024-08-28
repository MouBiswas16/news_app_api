import 'dart:convert';

import 'package:news_app_api/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final everythingApi =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=eb9fcf860d054b17b76c68076a420136";
  final headlineApi =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=eb9fcf860d054b17b76c68076a420136";

  Future<List<NewsModel>> allNews() async {
    http.Response response = await http.get(Uri.parse(everythingApi));

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);

        List<dynamic> body = json["articles"];
        List<NewsModel> articlesList =
            body.map((news) => NewsModel.fromJson(news)).toList();

        return articlesList;
      } else {
        throw ("No Data Available");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> headlineNews() async {
    http.Response response = await http.get(Uri.parse(headlineApi));

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);

        List<dynamic> body = json["articles"];
        List<NewsModel> articlesList =
            body.map((news) => NewsModel.fromJson(news)).toList();

        return articlesList;
      } else {
        throw ("No Data Available");
      }
    } catch (e) {
      throw e;
    }
  }
}
