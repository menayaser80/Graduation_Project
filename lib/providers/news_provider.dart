import 'package:flutter/cupertino.dart';

import '../models/news_model.dart';
import '../services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newList = [];

  List<NewsModel> get getNewsList {
    return newList;
  }

  Future<List<NewsModel>> fetchAllNews({required int pageindex,required String sortBy}) async {
    newList = await NewsAPiServices.getAllNews(page: pageindex,sortBy: sortBy);
    return newList;
  }
  Future<List<NewsModel>> fetchTopHeadlines() async {
    newList = await NewsAPiServices.getTopHeadlines();
    return newList;
  }
  Future<List<NewsModel>> searchNewsProvider({required String query}) async {
    newList = await NewsAPiServices.searchNews(query: query);
    return newList;
  }
  NewsModel findByDate({required String? publishedAt}) {
    return newList
        .firstWhere((newsModel) => newsModel.publishedAt == publishedAt);
  }
}
