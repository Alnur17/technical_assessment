import 'package:get/get.dart';

import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/article_list_model.dart';

class ArticleListController extends GetxController {
  var articles = <ArticleListModel>[].obs;
  var isLoading = true.obs;
  var isLoadingMore = false.obs;
  var errorMessage = ''.obs;
  var page = 1.obs;
  final int itemsPerPage = 20;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  Future<void> fetchArticles({bool loadMore = false}) async {
    try {
      if (loadMore) {
        isLoadingMore(true);
      } else {
        isLoading(true);
        page.value = 1;
        articles.clear();
      }

      errorMessage('');

      var headers = {'Content-Type': 'application/json'};

      final response = await BaseClient.getRequest(
        api: '${Api.allPost}?_page=${page.value}&_limit=$itemsPerPage',
        headers: headers,
      );

      final data = await BaseClient.handleResponse(response);

      if (data is List) {
        final newArticles = data
            .map((json) => ArticleListModel.fromJson(json))
            .toList();

        if (loadMore) {
          articles.addAll(newArticles);
        } else {
          articles.value = newArticles;
        }

        if (newArticles.isNotEmpty) {
          page.value++;
        }
      } else {
        errorMessage.value = 'Unexpected response format';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      if (loadMore) {
        isLoadingMore(false);
      } else {
        isLoading(false);
      }
    }
  }
}