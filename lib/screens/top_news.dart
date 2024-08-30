// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_api/api/news_api.dart';
import 'package:news_app_api/model/news_model.dart';
import 'package:news_app_api/screens/news_data.dart';

class TopNews extends StatefulWidget {
  const TopNews({super.key});

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  NewsApi newsApi = NewsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: newsApi.topHeadlineNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleList = snapshot.data ?? [];
            return ListView.builder(
                itemCount: articleList.length,
                itemBuilder: (context, index) {
                  return NewsData(
                    newsModel: articleList[index],
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
