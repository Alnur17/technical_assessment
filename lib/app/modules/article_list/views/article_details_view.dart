import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ArticleDetailsView extends GetView {
  const ArticleDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArticleDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ArticleDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
