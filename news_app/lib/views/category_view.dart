import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_listVeiw_Builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(category,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
            const Text(' news',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
          ],
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body:  Padding(
        padding:const EdgeInsets.all(10),
        child: CustomScrollView(
          physics:const BouncingScrollPhysics(),
          slivers: [
            NewsListViewBuilder(category: category,),
          ],
        ),
      ),
    );
  }
}
