import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_tile_listview.dart';

class NewsListViewBuilder extends StatefulWidget {
   const NewsListViewBuilder({super.key, required this.category});
   final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category:widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return NewsTileListView(article: snapShot.data!);
        } else if (snapShot.hasError) {
          return const ErorrMessage(message: 'The service is not avalibal now. Try later please...',);
        } else {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

class ErorrMessage extends StatelessWidget {
  const ErorrMessage({
    super.key,
    required this.message
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return  SliverFillRemaining(
        child:
            Text(message));
  }
}
