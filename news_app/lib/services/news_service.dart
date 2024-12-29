import 'package:dio/dio.dart';
import 'package:news_app/models/article.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=59f80f26a78f4ba8a46f3c8d2d3daf95&category=$category');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> data = jsonData['articles'];

      List<ArticleModel> articles = [];
      for (var article in data) {
        articles.add(ArticleModel.fromJson(article));
      }
      return articles;
    } catch (e) {
      print('Error in service: $e');
      return [];
    }
  }
}
