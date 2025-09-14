import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'common/app_constant/app_constant.dart';
import 'common/helper/local_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  var userToken = LocalStorage.getData(key: AppConstant.token) ?? '';

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Technical Assessment",
        // Just because i don't want to use the splash view right now
        initialRoute: userToken.isNotEmpty ? Routes.ARTICLE_LIST : Routes.LOGIN,
        getPages: AppPages.routes,
      ),
    ),
  );
}
