import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:technical_assessment/common/app_text_style/styles.dart';
import 'package:technical_assessment/common/helper/theme_controller.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/helper/local_store.dart';
import '../../../../common/localization/localization_controller.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_container.dart';
import '../../login/views/login_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final LocalizationController localizationController =
      Get.put(LocalizationController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          backgroundColor: themeController.isDarkMode.value ? AppColors.black : AppColors.mainColor,
          appBar: AppBar(
            backgroundColor: themeController.isDarkMode.value ? AppColors.black : AppColors.mainColor,
            title: Text(
              'settings'.tr,
              style: appBarStyle.copyWith(color: themeController.isDarkMode.value ? AppColors.white : AppColors.black,),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(
              children: [
                sh12,
                _buildThemeContainer(themeController),
                sh16,
                _buildLanguageContainer(localizationController),
                sh16,
                CustomContainer(
                  onTap: () {
                    LocalStorage.removeData(key: AppConstant.token);
                    Get.offAll(() => LoginView());
                  },
                  text: 'logout'.tr,
                  textStyle: h3.copyWith(
                    color: AppColors.red,
                  ),
                  imagePath: AppImages.logout,
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Container _buildLanguageContainer(
      LocalizationController localizationController) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('language'.tr, style: h3),
              Image.asset(AppImages.languageTwo, scale: 4),
            ],
          ),
          sh8,
          Obx(
            () => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    localizationController.changeLanguage('English');
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        localizationController.selectedLanguage.value ==
                                'English'
                            ? AppImages.checkBoxFilled
                            : AppImages.checkBox,
                        scale: 4,
                      ),
                      sw12,
                      Text('English', style: h4),
                    ],
                  ),
                ),
                sh8,
                GestureDetector(
                  onTap: () {
                    localizationController.changeLanguage('Bangla');
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        localizationController.selectedLanguage.value ==
                                'Bangla'
                            ? AppImages.checkBoxFilled
                            : AppImages.checkBox,
                        scale: 4,
                      ),
                      sw12,
                      Text('Bangla', style: h4),
                    ],
                  ),
                ),
                sh8,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildThemeContainer(ThemeController themeController) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('theme'.tr, style: h3),
          Obx(
            () => Switch(
              value: themeController.isDarkMode.value,
              onChanged: (value) {
                themeController.toggleTheme();
              },
              activeColor: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
