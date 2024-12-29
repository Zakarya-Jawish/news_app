import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/widgets/category_card.dart';

class CategorysListView extends StatelessWidget {
  const CategorysListView({
    super.key,
  });
 final List<CategoryModel> categorys =const [
  CategoryModel(title: 'sports', image: 'assets/technology.jpeg'),
  CategoryModel(title: 'business', image: 'assets/technology.jpeg'),
  CategoryModel(title: 'health', image: 'assets/technology.jpeg'),
  CategoryModel(title: 'technology', image: 'assets/technology.jpeg'),
  CategoryModel(title: 'science', image: 'assets/technology.jpeg'),
  CategoryModel(title: 'entertainment', image: 'assets/technology.jpeg'),
 ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>  CategoryCard(model:categorys[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: categorys.length,
      ),
    );
  }
}
