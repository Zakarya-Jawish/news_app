import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsTileListView extends StatelessWidget {
  const NewsTileListView({super.key, required this.article});

  final List<ArticleModel> article;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => NewsTile(aricle: article[index]),
        childCount: article.length,
      ),
    );
  }
}
