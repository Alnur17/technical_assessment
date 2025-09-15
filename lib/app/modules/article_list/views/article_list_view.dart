import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:technical_assessment/app/modules/article_list/views/article_details_view.dart';
import 'package:technical_assessment/app/modules/article_list/views/settings_view.dart';
import 'package:technical_assessment/common/app_color/app_colors.dart';
import 'package:technical_assessment/common/app_text_style/styles.dart';
import 'package:technical_assessment/common/widgets/custom_list_tile.dart';
import '../../../../common/helper/theme_controller.dart';
import '../controllers/article_list_controller.dart';

class ArticleListView extends StatefulWidget {
  const ArticleListView({super.key});

  @override
  State<ArticleListView> createState() => _ArticleListViewState();
}

class _ArticleListViewState extends State<ArticleListView> {
  final ArticleListController articleListController =
      Get.put(ArticleListController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !articleListController.isLoadingMore.value &&
          !articleListController.isLoading.value) {
        articleListController.fetchArticles(loadMore: true);
      }
    });

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
              'article_list'.tr,
              style: appBarStyle.copyWith(
                color: themeController.isDarkMode.value
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            titleSpacing: 24,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: IconButton(
                  onPressed: () {
                    Get.to(() => SettingsView());
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 28,
                    color: themeController.isDarkMode.value
                        ? AppColors.mainColor
                        : AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          body: Obx(() => articleListController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: themeController.isDarkMode.value
                      ? AppColors.white
                      : AppColors.black,
                ))
              : RefreshIndicator(
                  color: AppColors.white,
                  backgroundColor: AppColors.black,
                  onRefresh: () => articleListController.fetchArticles(),
                  child: ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20).r,
                    itemCount: articleListController.articles.length +
                        (articleListController.isLoadingMore.value ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (articleListController.isLoadingMore.value &&
                          index == articleListController.articles.length) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(
                              color: themeController.isDarkMode.value
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        );
                      }

                      final article = articleListController.articles[index];
                      return Padding(
                        padding: EdgeInsets.only(
                                bottom: index ==
                                        articleListController.articles.length - 1
                                    ? 0
                                    : 8)
                            .r,
                        child: CustomListTile(
                          leadingText: article.id.toString(),
                          title: article.title ?? 'No Title',
                          subtitle: article.body ?? 'No Body',
                          onTap: () {
                            Get.to(() => ArticleDetailsView(
                                  title: article.title ?? '',
                                  description: article.body ?? '',
                                ));
                          },
                        ),
                      );
                    },
                  ),
                )),
        );
      }
    );
  }
}
