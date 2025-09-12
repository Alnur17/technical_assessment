import 'package:get/get.dart';

import '../modules/article_list/bindings/article_list_binding.dart';
import '../modules/article_list/views/article_list_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_LIST,
      page: () => const ArticleListView(),
      binding: ArticleListBinding(),
    ),
  ];
}
