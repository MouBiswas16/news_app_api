// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/model/news_model.dart';
import 'package:news_app_api/screens/details_screen.dart';

class NewsData extends StatelessWidget {
  NewsModel? newsModel;
  NewsData({super.key, this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20)),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    newsModel: newsModel,
                  )));
        },
        child: SizedBox(
          child: Center(
            child: Column(
              children: [
                CachedNetworkImage(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: newsModel!.urlToImage.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Text(newsModel!.source!.name.toString()),
                Text(newsModel!.title.toString()),
                Container(
                    color: Colors.cyanAccent,
                    child: Text(newsModel!.author!.toString())),
                Text(newsModel!.publishedAt!.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
