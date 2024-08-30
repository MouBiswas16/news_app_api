// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app_api/model/news_model.dart';

class DetailsScreen extends StatefulWidget {
  NewsModel? newsModel;
  DetailsScreen({super.key, this.newsModel});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Details Screen"),
    );
  }
}
