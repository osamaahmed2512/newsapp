import 'package:dio/dio.dart';

import 'package:news_app/models/article_model.dart';

class NewService {
  final Dio dio;
  NewService(this.dio);

  Future<List<ArticleModel>> getnews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=bec009a316a641108076915c9c0ecefb&category=$category');
      Map<String, dynamic> jsondata = response.data;
      List<dynamic> articles = jsondata["articles"];
      // List<Map<String, dynamic>> articles= jsondata['articles']as List<Map<String, dynamic>> ;
      // for (var article in articles) {
      //   print(article['author']);
      // }
      List<ArticleModel> article_list = [];

      for (var article in articles) {
        ArticleModel article_model = ArticleModel.fromjson(article);
        article_list.add(article_model);
      }
      return article_list;
    } catch (e) {
      return [];
    }
  }
}
