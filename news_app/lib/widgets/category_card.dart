import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.model});
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 100,
        width: 180,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              model.image,
            ),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            model.title,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryView(category:model.title),
          ),
        );
      },
    );
  }
}
