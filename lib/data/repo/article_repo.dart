import 'package:sample_app/data/models/article.dart';
import 'package:http/http.dart'as http;
import 'package:sample_app/string.dart';
import 'dart:convert';

abstract class ArticleRepository{
  Future <List<Articles>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository{
  @override
  Future<List<Articles>> getArticles() async{
    var response = await http.get(AppStrings.articleUrl);
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      List<Articles> articles = ArticleResponseModel.fromJson(data).articles;
      return articles;
    }else{
      throw Exception();
    }

  }

}