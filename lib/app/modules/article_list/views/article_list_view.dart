import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:technical_assessment/common/app_color/app_colors.dart';

import '../../../../common/app_text_style/styles.dart';
import '../controllers/article_list_controller.dart';

class ArticleListView extends GetView<ArticleListController> {
  const ArticleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('ArticleListView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20).r,
            //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.silver,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: ListTile(
              onTap: () {},
              leading: Text(
                '1',
                style: h5,
              ),
              title: Text(
                'This is for the title',
                style: h5,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text('This is going to be the subtitle'),
            ),
            // Row(
            //   children: [
            //     Text(
            //       '1',
            //       style: h5,
            //     ),
            //     sw12,
            //     Text(
            //       'This is the title ',
            //       style: h5,
            //       maxLines: 1,
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
