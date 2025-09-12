import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/article_list_controller.dart';

class ArticleListView extends GetView<ArticleListController> {
  const ArticleListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArticleListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ArticleListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
