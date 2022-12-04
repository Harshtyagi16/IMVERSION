import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imversion/controller/newsServices.dart';

import '../models/article_model.dart';
import 'custom_news_container.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final articleService = Get.put(NewsService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News"),
          backgroundColor: Colors.redAccent.withOpacity(0.4),
          actions: [
            IconButton(onPressed: () {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sorted List")));}, icon: const Icon(Icons.error_outline))
          ],
        ),
        body: FutureBuilder(
            future: articleService.newsData(),
            builder: (context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Loading..."),
                    ],
                  ),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (ctx, i) {
                      return CustomNewContainer(
                        article: snapshot.data![i],
                      );
                    });
              }
              return const Text("error");
            }));
  }
}
