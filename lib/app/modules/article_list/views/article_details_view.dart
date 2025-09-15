import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_assessment/common/app_text_style/styles.dart';
import 'package:technical_assessment/common/size_box/custom_sizebox.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/helper/theme_controller.dart';

class ArticleDetailsView extends GetView {
  final String title;
  final String description;

  const ArticleDetailsView({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(() {
        return Scaffold(
          backgroundColor: themeController.isDarkMode.value
              ? AppColors.black
              : AppColors.mainColor,
          appBar: AppBar(
            backgroundColor: themeController.isDarkMode.value
                ? AppColors.black
                : AppColors.mainColor,
            title: Text(
              'article_details'.tr,
              style: appBarStyle.copyWith(
                color: themeController.isDarkMode.value
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.downloading, size: 28),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20).r,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sh20,
                  Text(
                    title,
                    style: h3.copyWith(color: themeController.isDarkMode.value
                        ? AppColors.white
                        : AppColors.black,),
                  ),
                  sw5,
                  sh12,
                  Text(
                    description,
                    style: h5.copyWith(color: themeController.isDarkMode.value
                        ? AppColors.white
                        : AppColors.black,),
                  ),
                  sh20,
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}