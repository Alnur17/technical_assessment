import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/theme_controller.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_loader.dart';
import '../../../../common/widgets/custom_textfield.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = Get.put(LoginController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          themeController.isDarkMode.value ? AppColors.black : AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'login_to_your_account'.tr,
              style: h2.copyWith(
                color: themeController.isDarkMode.value
                    ? AppColors.white
                    : AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            sh12,
            Text(
              'login_description'.tr,
              style: h4.copyWith(color: AppColors.grey),
            ),
            sh40,
            Text('email'.tr,
                style: h4.copyWith(
                  color: themeController.isDarkMode.value
                      ? AppColors.white
                      : AppColors.black,
                )),
            sh8,
            CustomTextField(
              hintText: 'your_email'.tr,
              containerColor: AppColors.white,
              controller: loginController.emailTEController,
            ),
            sh12,
            Text('password'.tr, style: h4.copyWith(
              color: themeController.isDarkMode.value
                  ? AppColors.white
                  : AppColors.black,
            )),
            sh8,
            Obx(() => CustomTextField(
                  sufIcon: GestureDetector(
                    onTap: () {
                      loginController.togglePasswordVisibility();
                    },
                    child: Image.asset(
                      loginController.isPasswordVisible.value
                          ? AppImages.eye
                          : AppImages.eyeClose,
                      scale: 4,
                    ),
                  ),
                  obscureText: !loginController.isPasswordVisible.value,
                  hintText: 'password_placeholder'.tr,
                  containerColor: AppColors.white,
                  controller: loginController.passwordTEController,
                )),
            sh24,
            Obx(
              () {
                return loginController.isLoading.value == true
                    ? CustomLoader(color: AppColors.white)
                    : CustomButton(
                        text: 'login_button'.tr,
                        onPressed: () {
                          loginController.userLogin();
                        },
                        imageAssetPath: AppImages.arrowRightNormal,
                        gradientColors: AppColors.buttonColor,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
