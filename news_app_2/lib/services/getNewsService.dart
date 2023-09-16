import 'package:dio/dio.dart';

import '../models/getNewsModel.dart';

class NewsService {
  final Dio dio = Dio();
  Future<List<GetNewsModel>> getNews({required String catigory}) async {
    String baseUrl = 'https://newsapi.org/v2';
    String apiKey = 'e133e547e2e549968758f7d0366de490';
    try {
      Response response = await dio.get(
          '$baseUrl/top-headlines?apiKey=$apiKey&country=us&category=$catigory');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData["articles"];

      List<GetNewsModel> articlesList = [];

      for (var article in articles) {
        GetNewsModel getNewsModel = GetNewsModel.fromJson(article);
        articlesList.add(getNewsModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
