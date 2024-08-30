// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_api/api/news_api.dart';
import 'package:news_app_api/screens/news_data.dart';

import '../model/news_model.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  NewsApi newsApi = NewsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: newsApi.allNews(),
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
          if (snapshot.hasError) {
            return Text("There's no Data here.");
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
