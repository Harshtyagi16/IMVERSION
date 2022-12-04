import 'dart:convert';

import 'package:get/get.dart';
import 'package:imversion/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsService extends GetxController {

  RxList allNews = <Article>[].obs;

  Future<List<Article>> newsData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2022-12-02&to=2022-12-02&sortBy=popularity&apiKey=7c16618422e9461397e1376ec291642c");
    final response = await http.get(url);
    if(response.statusCode == 200){
      Map<String,dynamic> extractedNews = json.decode(response.body);
      List<dynamic> body = extractedNews["articles"];
      List<Article> articles = body.map((dynamic items) => Article.fromJson(items)).toList();
      return articles;
    }else{
      throw ("Cannot get the articles");
    }
  }
}
