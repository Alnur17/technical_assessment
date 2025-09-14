import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login to your Account',
              style: h2.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            sh12,
            Text(
              'It is quick and easy to log in. Enter your email and password below.',
              style: h4.copyWith(color: AppColors.grey),
            ),
            sh40,
            Text('Email', style: h4),
            sh8,
            CustomTextField(
              hintText: 'Your email',
              containerColor: AppColors.white,
              controller: loginController.emailTEController,
            ),
            sh12,
            Text('Password', style: h4),
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
                  hintText: '**********',
                  containerColor: AppColors.white,
                  controller: loginController.passwordTEController,
                )),
            sh24,
            Obx(
              () {
                return loginController.isLoading.value == true
                    ? CustomLoader(color: AppColors.white)
                    : CustomButton(
                        text: 'Login',
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
